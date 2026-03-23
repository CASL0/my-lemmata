# AI コーディングエージェント指示

## プロジェクト概要

**my-lemmata** は、3 つの教科書からの証明を記録する日本語の数学補題集です：

1. 微分積分学（微積分）- 笠原
2. 線型代数の基礎（線型代数）- 永田
3. これなら分かる最適化数学（最適化数学）- 金谷

このプロジェクトは **LaTeX**（`platex` エンジン）で構成され、Dev Container 環境で管理されています。

## 技術スタック

- **言語**: LaTeX（UTF-8 エンコーディング、日本語数学証明）
- **ビルドツール**: `.latexmkrc` 設定を備った `latexmk`
- **フォーマッター**: LaTeX 用の `tex-fmt`、Markdown 用の `prettier`
- **開発環境**: Dev Container（Debian trixie + texlive-full）
- **バージョン管理**: pre-commit フックを含む Git
- **IDE**: LaTeX Workshop 拡張機能付きの VS Code

## 命名表記と補題の規則

- 補題は原文の教科書の命題番号に合わせて番号が付けられます（例：補題 2.3 は第 2 章の定理 2.3）
- `main.tex` の各章は 1 冊の教科書に対応し、トピック用のセクションがあります
- LaTeX 定理環境：`\newtheorem*{lemma}{補題}`、引用形式は `[1.30]`
- すべての数学証明は厳密で自己完結している必要があります。教科書の議論のギャップを埋めることが目標です

## AIエージェント対話ガイドライン

- **対話言語**: ユーザとの対話は必ず日本語で行う
- **技術用語**: 日本語での説明が不自然な場合を除き、技術用語も日本語化する（例：`platex` は platex のまま、`LaTeX` は LaTeX のまま）
- **簡潔性**: 技術的な説明は明確かつ簡潔に、不要な冗長性は避ける
- **数学的フィードバック**: ユーザは数学に詳しいため、論理的な誤りや一般化の可能性、より優れた表現方法を発見した場合は積極的に提案する

## 開発ワークフロー

### ビルド

```bash
# ワークスペースルートから、LaTeX Workshop は latexmk 経由で自動的にコンパイルします（Ctrl+Alt+B）
# または手動で:
latexmk -pdf main.tex
```

### フォーマッティング

- **LaTeX**: 保存時に `tex-fmt` で自動フォーマット（VS Code で設定）
- **Markdown**: `prettier` で自動フォーマット
- **Git**: pre-commit フックは空白文字、行末、ファイル一貫性を検証します

### ファイル検証

- `.pre-commit-config.yaml` は末尾の空白文字除去と LF 行末を強制します
- pre-commit を手動で実行：`pre-commit run --all-files`

## ファイル構造

- **`main.tex`**: すべての章を含む主文書（現在 3 つの教科書、225 行）
- **`docs/development.md`**: 開発環境のドキュメンテーション（LaTeX エンジン、フォーマッター選択）
- **`.latexmkrc`**: `platex` と UTF-8、synctex サポートを指定するビルド設定
- **`.devcontainer/`**: texlive-full + tex-fmt + git を定義する Docker イメージ

## ファイル管理のルール

- **`main.pdf`**: Gitで管理される対象ですが、ユーザは直接コミットしてはいけません。必ずCIパイプラインによって自動生成され、更新されます

## 編集時の注意事項

1. **新規補題の追加**: 適切な章/セクションに以下の形式で挿入します：

   ```latex
   \begin{lemma}[X.Y]
     [statement]
     \begin{proof}
       [rigorous proof with logical connectives]
     \end{proof}
   \end{lemma}
   ```

2. **証明の修正**: 論理フローが正しい数学記号（`\Rightarrow`、`\therefore`、量指定子）を使用していることを確認します

3. **構造の更新**: 新規に数学書を追加する場合、必ず README.md の表を更新してください。テーブルに新しい教科書について記載し、`main.tex` の章/セクション構成も対応させます

4. **変更のテスト**: コミット前に `latexmk -pdf main.tex` でローカルにビルドします

## コミットメッセージの規則

コミットメッセージは **Conventional Commits** に従います：

```
type(scope): subject

body (optional)
```

### 主なタイプ：

- `feat`: 新機能（新しい補題の追加など）
- `fix`: バグ修正（証明の誤り修正など）
- `docs`: ドキュメント修正
- `refactor`: コード再構成（LaTeX構造の改善など）
- `test`: テスト追加

### 例：

- `feat(補題): 補題1.5を微分積分学に追加`
- `fix(proof): 補題2.3の証明ロジックを修正`
- `docs: README.mdの表を更新`
