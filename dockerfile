FROM python:3.13.9-slim
WORKDIR D:\Swapnil\Scaler\MLOps\LOAN_PREDICTION_FLASK_API\LOAN_PREDICTION_FLASK/DOCKER

COPY requirement.txt ./
RUN python3 -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirement.txt

COPY  . .
CMD ["python3", "-m", "flask", "--app", "Flask_UI/predictions.py", "run", "--host=0.0.0.0"]

#docker build -t loan_app_flask_v1 .
#docker run -p 8000:5000 loan_app_flask_v1

#docker login -u swapperss