#!/bin/bash
# =====================================================
# 3Dからくり図鑑 — GitHub自動Push スクリプト（Mac用）
# リポジトリ: https://github.com/n-seo3196/karakuri
# 公開URL:    https://n-seo3196.github.io/karakuri/
# 使い方: このファイルをダブルクリック or ./update.sh
# =====================================================

# スクリプト自身のあるフォルダに移動
cd "$(dirname "$0")"

echo "📦 ファイルの変更を確認中..."

# 変更がなければ終了
if git diff --quiet && git diff --staged --quiet; then
  echo "✅ 変更はありませんでした。"
  read -p "Enterで閉じる..." dummy
  exit 0
fi

# 変更内容を表示
echo ""
echo "以下のファイルが変更されています："
git status --short
echo ""

# コミットメッセージを自動生成（日付+時刻）
COMMIT_MSG="update: $(date '+%Y-%m-%d %H:%M')"

# ステージング → コミット → プッシュ
git add -A
git commit -m "$COMMIT_MSG"

echo ""
echo "🚀 GitHubにPush中..."
git push

if [ $? -eq 0 ]; then
  echo ""
  echo "✅ Push完了！GitHub Actionsが自動でサイトを更新します。"
  echo "   反映まで1〜2分かかります。"
else
  echo ""
  echo "❌ Pushに失敗しました。"
  echo "   setup-guide.md のトラブルシューティングを確認してください。"
fi

echo ""
read -p "Enterで閉じる..." dummy
