# make-latex-action

> GitHub Action to compile multiple LaTeX documents.

This action runs on docker using a [maximal TeXLive environment](https://hub.docker.com/r/danteev/texlive/) installed. Instead of the parent latex-action, though, it simply calls `make` in the specified directory.

## Inputs

* `working_directory`

    The working directory for the latex compiler to be invoked.

* `extra_system_packages`

    The extra packages to be installed by [`apt-get`](https://en.wikipedia.org/wiki/APT_(Package_Manager)) separated by space.

## Example

```yaml
name: Build LaTeX document
on: [push]
jobs:
  build_latex:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Git repository
        uses: actions/checkout@v1
      - name: Compile LaTeX document
        uses: patricklam/make-latex-action@master
        with:
          working_directory: lectures
```

## FAQs

### Where does the initial code come from?

The initial code is from [xu-cheng/latex-action](https://github.com/xu-cheng/latex-action), updated at [dante-ev/latex-action](https://github.com/dante-ev/latex-action).
The idea there is to initially provide all packages instead of using [texliveonfly](https://ctan.org/pkg/texliveonfly).
Using a full installation, this action also offers to use packages such as [pax](https://ctan.org/pkg/pax), which require other tooling such as perl.
More reasoning is given in [ADR-0002](https://github.com/dante-ev/docker-texlive/blob/master/docs/adr/0002-provide-all-packages.md#provide-all-packages).

## License

MIT
