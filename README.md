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
- Run  `curl -X POST -H "Accept: application/vnd.github.v3+json" \
   -H "Authorization: token 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" \
  https://api.github.com/repos/rishirajkumar97/advanced_web_tech_cw/actions/workflows/spin-instances-up.yaml/dispatches \
  -d '{"ref":"main"}'`  to boot the instances
- Visit the https://github.com/rishirajkumar97/advanced_web_tech_cw/actions to check if the spin up workflow was triggered successfully and wait for the same to complete.
- The project can be then viewed at this URL: TBD
- To stop the instances once the work is done, run `curl -X POST -H "Accept: application/vnd.github.v3+json" \
   -H "Authorization: token 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" \
  https://api.github.com/repos/rishirajkumar97/advanced_web_tech_cw/actions/workflows/spin-instances-down.yaml/dispatches \
  -d '{"ref":"main"}'
- Please ensure that the isntances are always spun down after verification or usage.

To view the Project UI, visit: TBD Once all the instances have started.
**Please Ensure to stop the instances once verification is done**

One more point to keep is the currently for the deployed Alpha Vantage Key we can retrieve only 25 XHR calls , further calls will default to automatically default to automatic data to ensure the app works smoothly.

## To run the dockerized version of this in local

- Checkout to docker-local branch via the command `git checkout docker-local`
- Run the docker compose.yml
  TODO

## To Contribute

Please create a feature branch from the existing main and then raise a pull request on to main and request for review from repository maintainers.
