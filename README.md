# Image classification "in-the-wild"

This repo is a homework for Deep Learning course (BMEVITMMA19) at BME university.

## Team

Team Name: Mirage

Team Members:
| Name    | Neptun |
| -------- | ------- |
| dr.Konyecsny Szonja Anilla  | DT9XRT    |
| Szabó Benedek Zoltán    | AG11M9    |


## Project description
```
The goal of this project is to gather you own real-world image dataset with different types of objects in it and train an image classifier for solving it.
Dataset examples: books vs shoes vs furniture, houseplants vs outdoor plants vs trees.
Make sure that your dataset contains at least 3 classes, with at least 50 examples each (1 image per object). 
Make sure that the gathered images are diverse, with varied view angles, background and lighting. 
Select classes such that the task is not trivial to solve.

The main difficulty in this task will be the small dataset size, think through what we learned in class for solving it. 
Build an image classification pipeline for your dataset and train multiple networks on it, compare their performance. Inspect failure cases.
```

## Our chosen topic

We have decided to classify food. The three classes chosen are: Bagel, Buger and Sandwich.
We have collected 50 image of all three categories and uploaded them into this repository.

## Files in this repository
- ```images``` folder: This directory contains the images that our solution will use.
- ```images\test``` folder: This directory contains the test images. The directory has bagel, burger and sandwich subdirectories which contain the actual images
- ```images\train``` folder: This directory contains the train images. The directory has bagel, burger and sandwich subdirectories which contain the actual images
- ```images\val``` folder: This directory contains the validation images. The directory has bagel, burger and sandwich subdirectories which contain the actual images
- ```test_output``` folder: This directory contains the expected classifications for the test input images.
- Dockerfile: Dockerfile for the docker container where the homework can run
- homework.ipynb: The notebook that contains the solution
- requirements.txt: A text file that contains the python dependencies for the previously mentioned notebook

## Related works

### Related GitHub repository:
``` https://lightning.ai/docs/pytorch/stable/notebooks/lightning_examples/cifar10-baseline.html ```

### Related paper:
``` https://arxiv.org/abs/1512.03385 ```

## Run and build container locally

### Build docker image
Run ```docker build -t melytanulas_hazi .``` command in the root of this directory.
This will build the Docker image

### Run docker image
Run ```docker run -d -it --name melytanulas melytanulas_hazi``` command in the root of this directory.

## How to run the pipeline
- Make sure everything is installed from requirements.txt
- Make sure you have the images folder set up (with test, train and validation datasets)
- Modify the hyperparameters in the appropriate code block if you want
- Run the ```homework.ipynb``` notebook
- Log into Wandb when the notebook prompts you to


Basic steps of the pipeline:
1. Load the images and analyze them
2. Define a custom DataModule for the task
3. Define an evaluating Python function
4. Define a baseline model, train and evaluate it (BaseLineModel)
5. Define a refined more complex model, train and evaluate it (ComplexModel)
6. Define a Transfer learning model based on Resnet18, train and evaluate it (TransferLearningModel)
7. Define an Ensemble model that ensembles the previous models, train and evaluate it (EnsembleModel)
8. Track the metrics of EnsembleModel in Wandb
9. Load up the best model from Wandb
10. Run test prediction on images from all three classes

## How to train the models
- Define the hyperparameters in the code block that has the markdown title "Define hyperparams" above it

Baseline:

- Run the code block "Define baseline model" to declare the baseline model
- Run the training and evaluation code block for the baseline model (located under the previous one)

Complex Model:

- Run the code block "Add complexity" to declare the complex model
- Run the training and evaluation code block for the complex model (located under the previous one)

Transfer learning model:

- Run the code block "Use transfer learning" to declare the transfer learning model
- Run the training and evaluation code block for the transfer learning model (located under the previous one)

Ensemble model:

- Run the code block "Ensemble models" to declare the ensemble model
- Run the code block under the previous one, that creates an instance of the ensemble model
- Run the block under the previous one, that defines the Wandb logger, checkpoint and early stopping callbacks and the trainer
- Run the training and evaluation code block for the complex model (located under the previous one)
- Run the code block under the previous one, to load up the best model from the run
- Run ```wandb.finish()``` to finish up the Wandb run (located under the previous one)

## How to evaluate the models

A model evaluation function is defined that can be used to evaluate models.

Call the ```evaluate_models``` function with these parameters: ```evaluated_model```, ```test_dataloader```, ```class_names``` and optionally a ```logger```.

An example evaluation call:
```evaluate_model(best_model, data_module.test_dataloader(), class_names, logger=wandb_logger)```

## Start the service in Docker

📌 **Note**: Make sure that the ```8888``` and ```7860``` ports are available on your machine, or just port these to another port on your machine.

First retrieve the checkpoint files for the models from Google Drive:
```https://drive.google.com/drive/folders/14OsdKF_OAy47146b8y1ewHGWa-fa5qbb?usp=sharing```

Put the files in the ```checks``` folder

Build the deploy Docker image:
```docker build -t melytanulas_hazi_deploy -f deploy/Dockerfile .```

Run the docker image:
```docker run -p 8888:8888 -p 7860:7860 -d -it --name melytanulas_deploy -v $(pwd):/app melytanulas_hazi_deploy```

Once the server starts, the service will be available at localhost:7860

To run the deploy image in train mode, so the models inside are retrained, set the ```TRAIN_MODELS_INSTEAD_OF_LOAD``` variable at the start of the ```homework.ipynb``` to True.

📌 **Note**: If you train the models during deployment, it will take a long time for the service to start.

## Setting up locally for development

### Build docker image
Run ```docker build -t melytanulas_hazi .``` command in the root of this directory.
This will build the Docker image

### Run docker image
Run ```docker run -p 8888:8888 -d -it --name melytanulas -v $(pwd):/app melytanulas_hazi``` command in the root of this directory.
This will run the Docker image, mount this directory to it (so your changes will be present in the container as well) and expose the container's ```8888``` port, so we can use it as a jupyter notebook server.

### Get the Jupyter server URL
If you open up the console of your running docker container, you should see in the logs something like this:
```
    To access the server, open this file in a browser:
         file:///root/.local/share/jupyter/runtime/jpserver-1-open.html
    Or copy and paste one of these URLs:
         http://ae6f16a8b1bc:8888/tree?token=<YOUR_TOKEN>
         http://127.0.0.1:8888/tree?token=<YOUR_TOKEN>
```

Your Jupyter server URL will be the last one (I prefer this) ```http://127.0.0.1:8888/tree?token=<YOUR_TOKEN>```.
Copy it from the console.

### Run Jupyter notebook
In your code editor install Jupyter plugin and open the ```homework.ipynb``` file.
If you try to execute the first block, the editor should prompt you to select a python environment or an existing Jupyter server.
Choose existing Jupyter server and copy the previously obtained server URL in the input.
When it asks you to select Python kernel, select Python 3 (I think this will be good, but correct me if I'm wrong)

### Your Jupyter notebook is running
At this point if you done everything correctly, the block in your Jupyter notebook should be executed.



## Objectives of the homework
### Phase 1
- Containerization 🟩
  - Dockerfile added, which can be used to run the notebook currently and in the future be able to run the homework
- Data acquisition and analysis 🟩
  - Data is acquired from the internet and added to the repository
  - Data analysis is performed on the dataset
- Data cleansing and preparation 🟩
  - Both train and test data is being cleaned and train data is preprocessed as well
### Phase 2
- Defining evaluation criteria 🟩
- Baseline (reference) model 🟩
- Incremental model development 🟩
### Phase 3
- Advanced evaluation 🟥
- ML as a service (prototype) 🟩
