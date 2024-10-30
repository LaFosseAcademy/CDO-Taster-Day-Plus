```yml
trigger:
- main                                   # The pipeline triggers on commits to the 'main' branch.

resources:
- repo: self                             # Refers to the current repository as the source of the pipeline.

variables:
  tag: '$(Build.BuildId)'                # A variable 'tag' is defined, set to the unique build ID.

stages:
- stage: Build                           # The pipeline consists of a single stage named 'Build'.
  displayName: Build image               # Display name for the stage.
  jobs:
  - job: Build                           # The stage contains one job, also named 'Build'.
    displayName: Build                   # Display name for the job.
    pool:
      vmImage: ubuntu-latest             # The job runs on an Ubuntu-based agent.

    steps:
    - task: Docker@2                     # The job uses the Docker@2 task to interact with Docker.
      displayName: Build an image        # Display name for the Docker task.
      inputs:
        containerRegistry: 'emilesherrott-docker-hub'  # Specifies the service connection to Docker Hub.
        repository: 'emilesherrott/pl-mvc-cloud'  # Docker repository where the image will be pushed.
        command: 'buildAndPush'          # The command 'buildAndPush' builds and pushes the Docker image.
        Dockerfile: '**/Dockerfile'      # The location of the Dockerfile in the repository.
        tags: '$(tag)'                   # The image is tagged with the build ID.
```