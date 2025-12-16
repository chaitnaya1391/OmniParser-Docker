FROM pytorch/pytorch:2.2.0-cuda12.1-cudnn8-runtime

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
    
RUN git clone --branch v.2.0.1 --single-branch https://github.com/microsoft/OmniParser.git    

WORKDIR /app/OmniParser

COPY weights/ ./weights/

EXPOSE 8000

CMD ["uvicorn", "gradio_demo:app", "--host", "0.0.0.0", "--port", "8000"]