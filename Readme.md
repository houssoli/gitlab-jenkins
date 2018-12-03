# Docker orchestration for Gitlab CI + Jenkins CI

Docker orchestration for Jenkins with a simple docker-compose.yml file that helps to run Gitlab and a Jenkins master/slaves as docker containers.

This is for simulation of a Gitlab as a code repository and builds are done on the jenkins master/slaves (expecting builds to be done on the Gitlab-CI, later when dind will be in place).

## Installation

1. Install [Docker](https://www.docker.com/).
2. Install [Docker Compose](https://docs.docker.com/compose/).

## Usage

  Get access to the source code base directory

    $ git clone git@git.devops.energisme.com:devops/gitlab-jenkins.git
    $ cd gitlab-jenkins

  Then

    $ chmod +x ./setup.sh ./download.sh ./runall.sh
    $ ./setup.sh
    $ ./runall.sh

  Or do it your self with

    $ docker-compose up -d

Setup Jenkins at [https://localhost:8443]()

* Login as `admin`. Get the generated admin password within master logs:

        $ docker-compose logs master

* Create user `jenkins` with password `jenkins` (or the one you've set within `docker-compose.yml`) in order to allow workers to connect.

        JENKINS_USER: "jenkins"
        JENKINS_PASS: "jenkins"

* To add more Jenkins workers:

        $ docker-compose scale worker=3

* Check that everything started as expected and the slave successfully connected to master:

        $ docker-compose logs worker

* Check that Gitlab is started and performing as expected:

        $ docker-compose logs gitlab


## Deployment Customization

* Add deployment environment variables:

      $ vim .env
      $ echo "JENKINS_NAME=docker-$(hostname)" >> .env

### Data Volumes

Depending of you setup in docker-compose.yml, you can access data for Jenkins Master is within `jenkins-master` volume:

    jenkins-master:/var/jenkins_home

    or

    /opt/automation/jenkins-master:/var/jenkins_home

And `jenkins-worker` volumes:

    jenkins-worker:/var/jenkins_home/worker

    or

    /opt/automation/jenkins-worker:/var/jenkins_home

While Gitlab volumes:

    /opt/automation/gitlab/config:/etc/gitlab
    /opt/automation/gitlab/logs:/var/log/gitlab
    /opt/automation/gitlab/data:/var/opt/gitlab
