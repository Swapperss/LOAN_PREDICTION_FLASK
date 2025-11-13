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

#AWS commands
#go to AWS CLI and Install windows MSI installer - run-> aws --version
#create user on IAM -> to connect from CLI to amazon servers
#run -> aws configure
#run push command from ECR section
#create cluster on ECS section
#go to task definition -> create new task definition -> Fargate -> give task name and role -> add container
#container name -> image -> from ECR copy paste image URI -> memory 0.5GB -> port mapping 5000
#create service -> Fargate -> give service name -> number of tasks 1 -> next steps -> next step -> create service
