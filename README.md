# Dockerfile-Jenkins-pipeline-maven-test-app
Docker file used to build image for maven java application
1. Clone the Spring Boot maven project from GitHub
2. Store the artifact in EVN. So that it will be used in final app image4. Copy the artifact to required place and rename
3. Expose the port
4. Use the app jar at runtime

Docker build command:
=====================

docker build --build-arg giturl=(maven-git-url) --build-arg artifactid=(artifactId) --build-arg version=1.0.0 -t maven/testapp:1.0.0 .

Using parameters so that it can be reused for other maven projects as well.

Jenkins pipeline script:
========================
 1. provisioned to get the user input for tags and artifact id
 2. It has multiple stages to clone, build, tag and push to ECR repository
 3. Finally it will remove the unused and exited containers and images. It is one of the best practices to save the storage space.