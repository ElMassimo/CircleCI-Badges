![CircleCI Badges](https://cloud.githubusercontent.com/assets/1158253/3914452/f083eb3c-2346-11e4-940f-482d282c3a39.png)

CircleCI badges with a nicer style, using [shields.io](http://shields.io).

## Usage
You can paste your CircleCI URL in [this page](https://circleci-badges-max.herokuapp.com) to get the URL for the badge, or
manually by doing:

```ruby
https://circleci-badges-max.herokuapp.com/img/:owner/:repo?token=:circle-ci-token
```
or:
```ruby
https://circleci-badges-max.herokuapp.com/img/:owner/:repo/:branch?token=:circle-ci-token
```

### Markdown

```ruby
[![Build Status](http://circleci-badges-max.herokuapp.com/img/:owner/:repo/:branch?token=:circle-ci-token)](https://circleci.com/gh/:owner/:repo/tree/:branch)
```
