# Images

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

## Description

A custom Github Action for `acm-ucr` repositories which uses `cwebp` to convert images located in the `/public` and compress images to webp.

## Usage

```yaml
steps:
  - name: Checkout
    uses: actions/checkout@v4
  - name: Running Image Conversion
    uses: acm-ucr/images@v2
    with:
      branch: ${{ github.head_ref }}
    env:
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Commands

### Create a New Tag

```bash
git tag -a -m "message" vX.XX
```

### Push Tag

```bash
git push origin vX.XX
```

## Update Primary Tag

```bash
git tag -fa -m "message" v2
```
