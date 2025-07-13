# 🚀 Medusa Headless Commerce Deployment on AWS ECS using Terraform

This project demonstrates the deployment of Medusa — a headless commerce backend — on AWS ECS Fargate using Docker, Terraform, and GitHub Actions (CI/CD).

---

## 📁 Project Structure


---

## 🧱 Infrastructure (via Terraform)

**Provisioned AWS resources:**

✅ VPC, Subnets (x2)  
✅ Internet Gateway, Route Tables  
✅ Security Groups  
✅ ECS Cluster + ECS Fargate Service  
✅ Application Load Balancer (ALB)  
✅ PostgreSQL via AWS RDS  
✅ CloudWatch Logs  
✅ ECS Task Definition with container details  

---

## ⚙️ CI/CD via GitHub Actions

CI/CD pipeline (`deploy.yml`) performs:

✅ Checkout repo  
✅ Docker login (via GitHub secrets)  
✅ Build + Push Docker image to DockerHub  
✅ Configure AWS credentials  
✅ Deploy updated ECS task definition

➡️ Triggered on: `git push` to `main` branch

---

📸 Screenshots 
 ### ✅ GitHub Actions Success

![GitHub Actions](<img width="977" height="562" alt="image" src="https://github.com/user-attachments/assets/ba1ee72c-716e-40c9-8f51-24e6482fe134" />
)

---

### ✅ ECS Cluster

![ECS Cluster](<img width="966" height="811" alt="image" src="https://github.com/user-attachments/assets/faf4ccc6-3e8a-4fd7-962a-dec0155173c3" />
)

---

### ✅ Terraform Apply Output

![Terraform Apply](<img width="706" height="242" alt="image" src="https://github.com/user-attachments/assets/be767c2f-636b-4a86-af63-b2a7bfa94e86" />
)

### ✅ ALB DNS - 502 Error (Medusa Backend Reached)
![ALB Error](<img width="1141" height="621" alt="Screenshot 2025-07-13 201022" src="https://github.com/user-attachments/assets/6c61ca0f-5193-4a87-a40a-9efe05942fe3" />
)

## 🔐 Secrets Used in GitHub Repo

Set these GitHub secrets in your repository:

```diff
+ DOCKER_USERNAME         → DockerHub username
+ DOCKER_PASSWORD         → DockerHub access token
+ AWS_ACCESS_KEY_ID       → IAM access key (rotated)
+ AWS_SECRET_ACCESS_KEY   → IAM secret key (rotated)

+ ALB DNS: http://medusa-alb-xxxxxxxxxx.ap-south-1.elb.amazonaws.com


🙋‍♂️ Submitted by
Name: Yogesh Saini
Track: AWS Cloud Internship (Flostat / Medusa)
Date: July 2025
