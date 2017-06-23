# Prize Draw Theme

A prize draw for Rusic that provides email signup with a referral mechanic.

![](screenshot.png)

## Setup

Copy `.rusic.yml.example` to `.rusic.yml` and configure it for the environments
you want to deploy to. If you’re stuck, please refer to the gem’s configuration
[instructions](https://github.com/rusic/rusic-gem#deploy-using-a-rusicyml-file).

Install development dependencies with `npm`.

```sh
$ npm install
```

Install deployment dependencies with `bundle`.

```sh
$ bundle
```

## Development

You can build the Sass and Coffee or watch _and_ build.

```sh
$ gulp build
$ gulp watch
```

## Deployment

Using the [Rusic gem](https://github.com/rusic/rusic-gem), deploy the theme to
your desired environment. You can also watch for changes and continuously
deploy.

```sh
$ bundle exec rusic deploy <environment>
$ bundle exec rusic deploy <environment> --watch
```
