# 3Dからくり図鑑 — GitHub連携セットアップガイド（Mac版）

---

## STEP 1：gitが入っているか確認する

Macの「ターミナル」を開いて（Spotlight検索で「ターミナル」と入力）、以下を貼り付けてEnter。

```bash
git --version
```

**「git version 2.xx.x」と表示されたら → STEP 2へ**

**「command not found」と表示されたら：**
```bash
xcode-select --install
```
ダイアログが出るので「インストール」を押す。完了したら STEP 2へ。

---

## STEP 2：GitHubのPersonal Access Tokenを作る

ClaudeからのZIP→Push自動化に必要なパスワード代わりのキーです。

1. GitHub にログインして右上のアイコン → **Settings**
2. 左メニュー一番下 → **Developer settings**
3. **Personal access tokens** → **Tokens (classic)**
4. **Generate new token (classic)** をクリック
5. 以下を設定：
   - Note（名前）: `karakuri-deploy`
   - Expiration: `No expiration`（期限なし）
   - スコープ: **repo** にチェック（一番上のやつ1つだけでOK）
6. 一番下の **Generate token** をクリック
7. 表示されたトークン（`ghp_xxxx...`）を**今すぐどこかにコピーしておく**（この画面を閉じると二度と見られない）

---

## STEP 3：karakuriフォルダをPCに用意する

ターミナルで以下をそのままコピペして実行：

```bash
# デスクトップに移動
cd ~/Desktop

# リポジトリをダウンロード（クローン）
git clone https://github.com/n-seo3196/karakuri.git

# フォルダに移動
cd karakuri
```

URLとユーザー名の入力を求められたら：
- Username: `n-seo3196`
- Password: STEP 2で作った **トークン**（GitHubのパスワードではない）

---

## STEP 4：update.sh をフォルダに置く

`update.sh` ファイルをZIPから取り出して、`~/Desktop/karakuri/` の中に置く。

初回だけ、ターミナルで以下を実行して実行権限を付与：

```bash
chmod +x ~/Desktop/karakuri/update.sh
```

---

## STEP 5：GitHub Actionsを有効にする

`.github/workflows/deploy.yml` ファイルをZIPに同梱しているので、クローンしたフォルダにすでに入っています。

GitHubのリポジトリページ（https://github.com/n-seo3196/karakuri）で：
1. **Settings** → **Pages**
2. Source を **GitHub Actions** に変更
3. 保存

---

## 日常の使い方（セットアップ後）

```
1. Claudeでファイルを修正してもらう
2. ZIPをダウンロードして解凍
3. 解凍したファイルを ~/Desktop/karakuri/ に上書きコピー
4. update.sh をダブルクリック（またはターミナルで ./update.sh）
5. 自動でGitHubにPush → https://n-seo3196.github.io/karakuri/ に反映 ✅
```

---

## トラブルシューティング

**update.sh をダブルクリックしても何も起きない**
→ ターミナルで `cd ~/Desktop/karakuri && ./update.sh` を実行

**「Permission denied」と出る**
→ `chmod +x ~/Desktop/karakuri/update.sh` を再実行

**「Authentication failed」と出る**
→ STEP 2のトークンが正しくコピーできているか確認。トークンは `ghp_` から始まる文字列
