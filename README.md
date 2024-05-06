# advanced_web_tech_cw
Advanced Web Tech Course Work Mono Repo
This repository consists of all the code base related to Financial Stock Data Application
Service:
- Auth Service
- News Data Service
- Financial Data Service
- UI Server Package

## To Start the instance deployed in cloud
- Run the following script and then visit this page
- Run `./start_instances.sh` to boot the instances
- Run `./stop_instances.sh` to stop the instances once the work is done

To view the Project UI, visit: https://web-ui-dot-meta-geography-243114.nw.r.appspot.com/ Once all the instances have started.
**Please Ensure to stop the instances once verification is done**

One more point to keep is the currently for the deployed Alpha Vantage Key we can retrieve only 25 XHR calls , further calls will default to automatically default to automatic data to ensure the app works smoothly.

## To run the dockerized version of this in local 

- Checkout to docker-local branch via the command `git checkout docker-local`
- Run the docker compose.yml
TODO

## To Contribute
Please create a feature branch from the existing main and then raise a pull request on to main and request for review from repository maintainers.