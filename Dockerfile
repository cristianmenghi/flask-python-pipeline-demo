FROM python:3.10-slim
WORKDIR /app
ADD . /app
RUN pip install -r requirements.txt
EXPOSE 80
#    ENV NAME World
CMD ["python", "run.py"]
