# Terraform DigitalOcean cluster

Create a populated and tagged DigitalOcean project.

![Review](https://img.shields.io/github/actions/workflow/status/JoelLefkowitz/swarmroles-support/review.yml)
![Version](https://img.shields.io/pypi/v/swarmroles-support)
![Downloads](https://img.shields.io/pypi/dw/swarmroles-support)

## Example

![Example](docs/images/example.png)

## Documentation\

Documentation and more detailed examples are hosted on [Github Pages](https://joellefkowitz.github.io/swarmroles-support).

## Usage

```hcl
locals {
  project = "example"
  env     = "production"

  droplet_count = 10
  ssh_dir       = "~/.ssh/example"

  domain       = "example.com"
  has_floating = true
}
```

To populate a list of ssh keys:

```bash
python keys.py                \
    --project example         \
    --env production          \
    --droplet_count 10        \
    --ssh_dir ~/.ssh/example  \
```

## Tooling

### Dependencies

To install dependencies:

```bash
yarn install
pip install .[all]
```

### Tests

To run tests:

```bash
thx test
```

### Documentation

To generate the documentation locally:

```bash
thx docs
```

### Linters

To run linters:

```bash
thx lint
```

### Formatters

To run formatters:

```bash
thx format
```

## Contributing

Please read this repository's [Code of Conduct](CODE_OF_CONDUCT.md) which outlines our collaboration standards and the [Changelog](CHANGELOG.md) for details on breaking changes that have been made.

This repository adheres to semantic versioning standards. For more information on semantic versioning visit [SemVer](https://semver.org).

Bump2version is used to version and tag changes. For example:

```bash
bump2version patch
```

### Contributors

- [Joel Lefkowitz](https://github.com/joellefkowitz) - Initial work

## Remarks

Lots of love to the open source community!

<div align='center'>
    <img width=200 height=200 src='https://media.giphy.com/media/osAcIGTSyeovPq6Xph/giphy.gif' alt='Be kind to your mind' />
    <img width=200 height=200 src='https://media.giphy.com/media/KEAAbQ5clGWJwuJuZB/giphy.gif' alt='Love each other' />
    <img width=200 height=200 src='https://media.giphy.com/media/WRWykrFkxJA6JJuTvc/giphy.gif' alt="It's ok to have a bad day" />
</div>
