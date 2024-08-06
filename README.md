# What is this?

[![Releasw](https://github.com/jacobsfederal/Container-Collection/actions/workflows/collect.yml/badge.svg?branch=main)](https://github.com/JacobsFederal/Container-Collection/actions/workflows/collect.yml)

This is a project that automatically collects and creates artifacts to ease in air-gapped transfer of the latest conainer images from the internet.

It runs actions as needed/manually, on GIT Commit Push, or automatically on Mondays at 00:00 

In this case, it:

- collects container images
- creates a set of ISO Files for release on Sharepoint

## Images include:

### Disk 1 - _Container-Images-\<DATE>.iso_

- UBI 8 & 9 latest images from DSO.mil IronBank
- JDK 8, 11, & 17 latest images from DSO.mil IronBank
- nginx latest images from DSO.mil IronBank
- Maven latest images from DSO.mil IronBank
- Skopeo latest images from DSO.mil IronBank
- Kaniko latest images from DSO.mil IronBank
- Redis latest images from DSO.mil IronBank
- RabbitMQ latest images from DSO.mil IronBank
- Sonatype Nexus latest images from DSO.mil IronBank
- Checkmarx CXCLI latest images from DSO.mil IronBank

### Disk 2 - _Atlassian-Images-\<DATE>.iso_

- Atlassian Jira latest images from DSO.mil IronBank
- Atlassian Confluence latest images from DSO.mil IronBank
- Atlassian Bitbucket latest images from DSO.mil IronBank
- Atlassian Support latest images from DSO.mil IronBank