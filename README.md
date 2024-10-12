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

None

## Run and build container locally

### Build docker image
Run ```docker build -t melytanulas_hazi .``` command in the root of this directory.
This will build the Docker image

### Run docker image
Run ```docker run -p 8888:8888 -d -it --name melytanulas -v $(pwd):/app melytanulas_hazi``` command in the root of this directory.
This will run the Docker image, mount this directory to it (so your changes will be present in the container as well) and expose the container's ```8888``` port, so we can use it as a jupyter notebook server.


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
- Defining evaluation criteria 🟥
- Baseline (reference) model 🟥
- Incremental model development 🟥
### Phase 3
- Advanced evaluation 🟥
- ML as a service (prototype) 🟥

## Code owners
- dr.Konyecsny Szonja Anilla (DT9XRT)
- Szabó Benedek Zoltán (AG11M9)
