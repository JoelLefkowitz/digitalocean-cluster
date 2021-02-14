# Terraform DigitalOcean Cluster

Create a populated and tagged DigitalOcean project

### Status

| Source     | Shields                                                        |
| ---------- | -------------------------------------------------------------- |
| Project    | ![license][license] ![release][release]                        |
| Raised     | [![issues][issues]][issues_link] [![pulls][pulls]][pulls_link] |

### Usage

```hcl
module "example-production" {
  source = "terraform-digitalocean-cluster"
  
  project = "example"
  env = "production"
  
  droplet_count = 10
  ssh_dir = "~/.ssh/example"
  domain_name = "example.com"
}
```

### Utils

To populate a list of ssh keys:

```bash
python keys.py                \
    --project example         \
    --env production          \
    --droplet_count 10        \
    --ssh_dir ~/.ssh/example  \
```

### Versioning

[SemVer](http://semver.org/) is used for versioning. For a list of versions available, see the tags on this repository.

Bump2version is used to version and tag changes.
For example:

```bash
bump2version patch
```

Releases are made on every major change.

### Author

- **Joel Lefkowitz** - _Initial work_ - [Joel Lefkowitz](https://github.com/JoelLefkowitz)

See also the list of contributors who participated in this project.

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

### Acknowledgments

None yet!

<!--- Table links --->

[license]: https://img.shields.io/github/license/joellefkowitz/tornado
[release]: https://img.shields.io/github/v/tag/joellefkowitz/tornado
[issues]: https://img.shields.io/github/issues/joellefkowitz/tornado "Issues"
[issues_link]: https://github.com/JoelLefkowitz/tornado/issues
[pulls]: https://img.shields.io/github/issues-pr/joellefkowitz/tornado "Pull requests"
[pulls_link]: https://github.com/JoelLefkowitz/tornado/pulls
