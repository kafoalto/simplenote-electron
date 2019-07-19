workflow "Build and Push to WebApp" {
  on = "push"
  resolves = ["Deploy Develop"]
}

workflow "Build and Push to WebApp Staging" {
  on = "release"
  resolves = ["Deploy Staging"]
}

action "Deploy Develop" {
  uses = "./actions/deploy-develop"
  secrets = ["GITHUB_TOKEN", "APP_ID"]
  env = {
    PUSHED_BRANCH = "develop"
    COMMIT_BRANCH = "webapp-develop"
  }
}

action "Deploy Staging" {
  uses = "./actions/deploy-develop"
  secrets = ["GITHUB_TOKEN", "APP_ID"]
  env = {
    COMMIT_BRANCH = "webapp-staging"
  }
}
