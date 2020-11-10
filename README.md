# action-codenarc

[![Test](https://github.com/asaasdev/action-codenarc/workflows/Test/badge.svg)](https://github.com/asaasdev/action-codenarc/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/asaasdev/action-codenarc/workflows/reviewdog/badge.svg)](https://github.com/asaasdev/action-codenarc/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/asaasdev/action-codenarc/workflows/depup/badge.svg)](https://github.com/asaasdev/action-codenarc/actions?query=workflow%3Adepup)
[![release](https://github.com/asaasdev/action-codenarc/workflows/release/badge.svg)](https://github.com/asaasdev/action-codenarc/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/asaasdev/action-codenarc?logo=github&sort=semver)](https://github.com/asaasdev/action-codenarc/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)

## Input

<!-- TODO: update -->
```yaml
inputs:
  github_token:
    description: 'GITHUB_TOKEN'
    default: '${{ github.token }}'
  workdir:
    description: 'Working directory relative to the root directory.'
    default: '.'
  ### Flags for reviewdog ###
  level:
    description: 'Report level for reviewdog [info,warning,error]'
    default: 'error'
  reporter:
    description: 'Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].'
    default: 'github-pr-check'
  filter_mode:
    description: |
      Filtering mode for the reviewdog command [added,diff_context,file,nofilter].
      Default is added.
    default: 'added'
  fail_on_error:
    description: |
      Exit code for reviewdog when errors are found [true,false]
      Default is `false`.
    default: 'false'
  reviewdog_flags:
    description: 'Additional reviewdog flags'
    default: ''
```

## Usage
<!-- TODO: update. replace `template` with the linter name -->

```yaml
name: reviewdog
on: [pull_request]
jobs:
  # TODO: change `linter_name`.
  linter_name:
    name: runner / codenarc
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: asaasdev/action-codenarc@v1
        with:
          github_token: ${{ secrets.github_token }}
          # Change reviewdog reporter if you need [github-pr-check,github-check,github-pr-review].
          reporter: github-pr-review
          # Change reporter level if you need.
          # GitHub Status Check won't become failure with warning.
          level: warning
```
