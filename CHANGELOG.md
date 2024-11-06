# v0.5.2

## Other Changes
* chore: Update lacework provider dependency to ~>2.0 (#35) (Zeki Sherif)([8bf99b9](https://github.com/lacework/terraform-aws-ecs-agent/commit/8bf99b908427832408c2cd7f652a96b39fdb9cb7))
* chore(GROW-2952): add codeowners (#33) (Matt Cadorette)([658e160](https://github.com/lacework/terraform-aws-ecs-agent/commit/658e16070c223d830e2688f9fe22cd4c97f4b241))
* ci: migrate from codefresh to github actions (#32) (Timothy MacDonald)([f819107](https://github.com/lacework/terraform-aws-ecs-agent/commit/f819107dbc0a69230729cf5328df1308fc4fd7c2))
* ci: version bump to v0.5.2-dev (Lacework)([ad5c5a6](https://github.com/lacework/terraform-aws-ecs-agent/commit/ad5c5a6c6fe47461ea637b907080a7fc7d3faeae))
---
# v0.5.1

## Other Changes
* chore: set local var module name (#30) (Darren)([91ab168](https://github.com/lacework/terraform-aws-ecs-agent/commit/91ab16897639a1aba39be08e21e0f120951ae06e))
* ci: version bump to v0.5.1-dev (Lacework)([97ef589](https://github.com/lacework/terraform-aws-ecs-agent/commit/97ef589e3a6084a4c7addc51aa3ebcc1daaeb4b7))
---
# v0.5.0

## Features
* feat: deprecate support for Terraform 0.12 and 0.13 (#20) (Darren)([b8dbcbb](https://github.com/lacework/terraform-aws-ecs-agent/commit/b8dbcbbeb6123fa9482536d5a83e2017fb2e6ef9))
## Bug Fixes
* fix(CPLAT-672): Update references to api.lacework.net (Atul Singh)([ef32867](https://github.com/lacework/terraform-aws-ecs-agent/commit/ef32867495a9e661ce77d9ec45f492cd772b8696))
## Documentation Updates
* docs(readme): add terraform docs automation (#27) (Timothy MacDonald)([5f0f29b](https://github.com/lacework/terraform-aws-ecs-agent/commit/5f0f29b87cac7d36a90a6f16f3409edb530ed18d))
* docs(RAIN-54746): update example urls (Atul Singh)([091c359](https://github.com/lacework/terraform-aws-ecs-agent/commit/091c359238dc4e19d46dc8083712f8d13f94dbfa))
## Other Changes
* chore: add lacework_metric_module datasource (#28) (Darren)([fdc7c88](https://github.com/lacework/terraform-aws-ecs-agent/commit/fdc7c88f57b681b3902112c68165e56277cb0a6f))
* chore: update PR template (#19) (Darren)([e52d3a9](https://github.com/lacework/terraform-aws-ecs-agent/commit/e52d3a91b6493c5a0b66e5bde9c5ac6be7c41d23))
* ci: tfsec (jon-stewart)([f1896c5](https://github.com/lacework/terraform-aws-ecs-agent/commit/f1896c54e0a87ef99d943dd0118ccb122484d579))
* ci: version bump to v0.4.1-dev (Lacework)([c93e5cb](https://github.com/lacework/terraform-aws-ecs-agent/commit/c93e5cb08e2c66367db4350cf25a23b90711c43c))
---
# v0.4.0

## Features
* feat: ability to specify the datacollector image (#17) (Tim Arenz)([fe15123](https://github.com/lacework/terraform-aws-ecs-agent/commit/fe15123d31f29a5708b570dc515b9cde8acdc298))
## Documentation Updates
* docs: Add contributing documentation (#16) (Darren)([7942688](https://github.com/lacework/terraform-aws-ecs-agent/commit/794268833d8d5daa67ece4bc1d353ae03370ba11))
## Other Changes
* chore: version bump to v0.3.2-dev (Lacework)([1e8bae6](https://github.com/lacework/terraform-aws-ecs-agent/commit/1e8bae6c095f16708f63e187ae7d46c75b5c4b13))
* ci: sign lacework-releng commits (#15) (Salim Afiune)([c2d2c67](https://github.com/lacework/terraform-aws-ecs-agent/commit/c2d2c6726563e0d794176f0b903d5689716124a2))
---
# v0.3.1

## Bug Fixes
* fix: a logic error could cause an unused SSM parameter to be created (Alan Nix)([3716158](https://github.com/lacework/terraform-aws-ecs-agent/commit/371615829aea2e2df6194e28688aa2ad33c1d97a))
* fix: made `ecs_launch_type` a configurable parameter (Alan Nix)([b3f66c3](https://github.com/lacework/terraform-aws-ecs-agent/commit/b3f66c38a06adfa0b9f613516d08e255479688d7))
## Documentation Updates
* docs: header correction for `server-url` example (Alan Nix)([10de9ea](https://github.com/lacework/terraform-aws-ecs-agent/commit/10de9eacbd8ab8866aa371a2ac459deb9b280fe8))
* docs: update all examples/ (Salim Afiune Maya)([2582b3d](https://github.com/lacework/terraform-aws-ecs-agent/commit/2582b3dba08ee66077c8372ec1919ee00b1a6d12))
## Other Changes
* chore: version bump to v0.3.1-dev (Lacework)([ea6d833](https://github.com/lacework/terraform-aws-ecs-agent/commit/ea6d83355b5417eb4a4e1be72fb586de9e9490fc))
---
# v0.3.0

## Features
* feat: add ability to change Lacework Server URL (#9) (Alan Nix)([a901333](https://github.com/lacework/terraform-aws-ecs-agent/commit/a901333cee4c01478c2f7c582ce6eb1ef8a40915))
## Other Changes
* chore: version bump to v0.2.3-dev (Lacework)([28cbc1c](https://github.com/lacework/terraform-aws-ecs-agent/commit/28cbc1c0384a5c6445a8fb7ed0491e97e09cb3ae))
---
# v0.2.2

## Other Changes
* chore: bump required version of TF to 0.12.31 (#7) (Scott Ford)([f9c3760](https://github.com/lacework/terraform-aws-ecs-agent/commit/f9c3760caa9b2e6a0a2a0b334a5a5b37682beb33))
* chore: version bump to v0.2.2-dev (Lacework)([026457c](https://github.com/lacework/terraform-aws-ecs-agent/commit/026457c4855a686b0cc2bce8f2b91fa1fe22fab2))
---
# v0.2.1

## Documentation Updates
* docs: fix release badge in README.md (#5) (Salim Afiune)([6161133](https://github.com/lacework/terraform-aws-ecs-agent/commit/61611339466ac655ebf7ece89613f4e16e19517c))
## Other Changes
* chore: version bump to v0.2.1-dev (Lacework)([8490399](https://github.com/lacework/terraform-aws-ecs-agent/commit/849039951a223e486717c7d15c691a38969142c6))
---
# v0.2.0

## Features
* feat: initial implementation of ECS Terraform Module (#1) (Alan Nix)([484f797](https://github.com/lacework/terraform-aws-ecs-agent/commit/484f7978ba2792c51e490d19f4cbd12035078475))
## Other Changes
* chore: apply Terraform Module scaffolding (#2) (Salim Afiune)([cfc2772](https://github.com/lacework/terraform-aws-ecs-agent/commit/cfc2772bff5d7aaaef53d156e9998466d4363b51))
* ci: fix finding major versions during release (#3) (Salim Afiune)([b8faf35](https://github.com/lacework/terraform-aws-ecs-agent/commit/b8faf35087278fa06a275db3b2ce479ae5278cc1))
---
