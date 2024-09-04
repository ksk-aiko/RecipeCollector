# ベースイメージ
FROM node:18

# 作業ディレクトリの設定
WORKDIR /app

# 依存関係をインストール
COPY package*.json ./
RUN npm install

# アプリケーションのコピー
COPY . .

# 開発サーバの起動
CMD ["npm", "start"]
