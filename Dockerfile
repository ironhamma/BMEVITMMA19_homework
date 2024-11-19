FROM python:3.10

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install jupyter

EXPOSE 8888
EXPOSE 7860

ENV GRADIO_SERVER_NAME="0.0.0.0"

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]