# AWS Elasticache Versions

### What is it
This repository contains tags with all versions of AWS Elasticache of type `redis` that are updated regularly using the official AWS Elasticache API. The purpose of this repo is to provide a datasource for **[Renovate](https://docs.renovatebot.com/)** to monitor and update the database engine versions in your Terraform files. 

### How it works 
This repo uses a GitHub Action to fetch the latest versions from the AWS API and create or update the corresponding tags. The tags are named as `engine_version`, such as *5.0.4*. The tags are sorted by the docker versioning scheme, which follows the semantic versioning rules. 
The GitHub Action runs every Monday at 00:00 UTC and pushes any new or updated tags to this repo. 

### How to use
To use this repo, you need to have Renovate installed and configured. You need to add a custom regex manager in your `renovate.json` file, like this for example: 
```
"regexManagers": [ 
   { 
     "description": "Update AWS Elasticache versions", 
     "fileMatch": ["^.*/[^/]+\.(tf|tfvars)$"], 
     "matchStringsStrategy": "combination", 
     "matchStrings": [
        "engine\\s*=\\s*\"(?.*)\"",
        "\\sengine_version\\s*=\\s*\"(?.*)\""
      ], 
      "datasourceTemplate": "github-tags",
      "depNameTemplate": "Revolgy-Business-Solutions/{{{depName}}}",
      "versioningTemplate": "docker" 
    } 
 ] 
```
The regex manager will match the engine name and version from your Terraform files that match the file pattern:
```
engine         =  "redis"
engine_version =  "5.0.4"
```
The regex manager will use the *[github-tags](https://docs.renovatebot.com/modules/datasource/github-tags/)* datasource to fetch the latest tags from this repo as the available versions for the engine.
