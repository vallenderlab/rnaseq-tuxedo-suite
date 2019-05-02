# rnaseq-tuxedo-suite

[![Snakemake](https://img.shields.io/badge/snakemake-≥3.12.0-brightgreen.svg)](https://snakemake.bitbucket.io)
[![Build Status](https://travis-ci.org/vallenderlab/rnaseq-tuxedo-suite.svg?branch=master)](https://travis-ci.org/vallenderlab/rnaseq-tuxedo-suite)

A snakemake workflow for RNAseq using the Tuxedo suite.

## Authors

* Shaurita Hutchins - [@sdhutchins](https://github.com/sdhutchins)

## Usage

Ensure that `snakemake` and `pyyaml` have been installed via `pip`.

If you intend to make reports, install `pygraphviz` using `pip`.

### Step 1: Install workflow

If you simply want to use this workflow, download and extract the [latest release](https://github.com/vallenderlab/rnaseq-tuxedo-suite/releases).
If you intend to modify and further extend this workflow or want to work under version control, fork this repository as outlined in [Advanced](#advanced). The latter way is recommended.

In any case, if you use this workflow in a paper, don't forget to give credits to the authors by citing the URL of this repository and, if available, its DOI (see above).

### Step 2: Configure workflow

Configure the workflow according to your needs via editing the file `config.yaml`.

### Step 3: Execute workflow

#### Perform a dry-run

```console
[username@doserver]$ snakemake --use-conda -n
```

#### Execute the workflow locally
    
```console
[username@doserver]$ snakemake --use-conda --cores $N
```

using `$N` cores or run it in a cluster environment via

```console
[username@doserver]$ snakemake --use-conda --cluster qsub --jobs 100
```

or

```console
[username@doserver]$ snakemake --use-conda --drmaa --jobs 100
```

#### Using Singularity

If you not only want to fix the software stack but also the underlying OS, use

```console
[username@doserver]$ snakemake --use-conda --use-singularity
```

in combination with any of the modes above.
See the [Snakemake documentation](https://snakemake.readthedocs.io/en/stable/executable.html) for further details.

### Step 4: Analyze results

After successful execution, you can create a self-contained interactive HTML report with all results via:

```console
[username@doserver]$ snakemake --report report.html
```
This report can, e.g., be forwarded to your collaborators.

## Advanced Usage

The following recipe provides established best practices for running and extending this workflow in a reproducible way.

1. [Fork](https://help.github.com/en/articles/fork-a-repo) the repo to a personal or lab account.
2. [Clone](https://help.github.com/en/articles/cloning-a-repository) the fork to the desired working directory for the concrete project/run on your machine.
3. [Create a new branch](https://git-scm.com/docs/gittutorial#_managing_branches) (the project-branch) within the clone and switch to it. The branch will contain any project-specific modifications (e.g. to configuration, but also to code).
4. Modify the config, and any necessary sheets (and probably the workflow) as needed.
5. Commit any changes and push the project-branch to your fork on github.
6. Run the analysis.
7. Optional: Merge back any valuable and generalizable changes to the [upstream repo](https://github.com/vallenderlab/rnaseq-tuxedo-suite) via a [**pull request**](https://help.github.com/en/articles/creating-a-pull-request). This would be **greatly appreciated**.
8. Optional: Push results (plots/tables) to the remote branch on your fork.
9. Optional: Create a self-contained workflow archive for publication along with the paper (snakemake --archive).
10. Optional: Delete the local clone/workdir to free space.


## Testing

Tests cases are in the subfolder `.test`. They are automtically executed via continuous integration with Travis CI.
