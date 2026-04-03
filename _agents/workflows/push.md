---
description: GitHubに変更をプッシュする
---
// turbo-all

このワークフローは、現在のワークスペースにあるすべての変更をGitHubへ自動でアップロード（プッシュ）します。
※現在のGitHubトークンはActions（.githubフォルダの更新）権限を持っていないため、自動で該当フォルダを除外してコミット・プッシュを安全に実行します。

1. GitHub Actionの権限エラーを回避しつつ、変更されたファイルをステージングしてコミットします。
`git add --all -- :^.github && git commit -m "update: auto sync via ai workflow"`

2. メインブランチへプッシュします。
`git push origin main`
