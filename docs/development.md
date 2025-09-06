# Development

## 組版システム

[`LaTeX`](https://www.latex-project.org/) を使用している。エンジンは `platex` としている。

[`typst`](https://github.com/typst/typst) にするかも

## 執筆環境

[Dev Container](https://containers.dev/)で`debian:trixie`に`texlive`をインストールしている。

`debian`にした理由は、パッケージマネージャ（`apt`）から`tex-fmt`をインストールできるため。

## Formatter

- LaTeX：[`tex-fmt`](https://github.com/WGUNDERWOOD/tex-fmt)
- Markdown：[`prettier`](https://prettier.io/)
