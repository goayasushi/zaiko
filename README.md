# アプリケーション名
zaiko

# アプリケーション概要
製造業における部品の入出庫・在庫を管理できるアプリケーション。
棚卸表をcsv出力可能。

# URL
https://zaiko.onrender.com

# テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- テスト用アカウントメールアドレス：test@com
- テスト用アカウントパスワード：test11

# 利用方法
## 一覧機能
- サイドバーから仕入先、部品、入庫、出庫、在庫の各一覧画面へ遷移
## 登録機能
- サイドバーから仕入先、部品、入庫、出庫、在庫の各登録画面へ遷移
- 部品の登録は登録されている仕入先から選択
- 入出庫の登録は登録されている部品から選択
## CSV出力機能
- 在庫一覧画面のCSV出力をクリックすることで出力

# 作成背景
前職において製造部門があり、その部品管理に課題を感じておりました。  
具体的には、下記のような課題です。  
- エクセル等で管理しており、商品名等のデータにばらつきが生じている  
- 理論値在庫数が算出できていない  
- 棚卸表の作成に時間を要している  

以上の課題を解決できるような機能を考え、アプリケーションを作成しました。  

# 要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1DFeQ_zoq5AOc3sLQ_lhf9LkXbmWWTPElGXurzbTBj6o/edit#gid=982722306) 

# 実装機能についての画像・GIF
[![Image from Gyazo](https://i.gyazo.com/c1825731acd9e6938df379c452c4b4c0.png)](https://gyazo.com/c1825731acd9e6938df379c452c4b4c0)

# 実装予定の機能
- 一覧画面の月次表示（入庫、出庫、在庫）
- 削除機能（仕入先、部品、入庫、出庫）
- 編集機能（仕入先、部品、入庫、出庫）
- 項目別集計のグラフ表示（仕入先毎、単月利益）

# データベース設計
![ER](https://user-images.githubusercontent.com/76515589/228406188-4bb6a1d3-3ed0-4b00-bed1-efa57d6a7a58.png)

# 画面遷移図
![transition](https://user-images.githubusercontent.com/76515589/228406559-4c2ec0c1-56d3-49a4-a244-6fb830474ef8.png)

# 開発環境
- フロントエンド：HTML、CSS
- バックエンド：Ruby
- フレームワーク：Ruby on Rails
- データベース：MySQL、PostgreSQL
- インフラ：Render
- テスト：RSpec
- テキストエディタ：Visual Studio Code
- タスク管理：GitHubプロジェクトボード

# ローカルでの動作方法
% git clone https://github.com/goayasushi/zaiko.git  
% cd zaiko  
% bundle install  
% yarn install  

# 工夫したポイント
## 機能面
- 部品別の入出庫数の表示：sumメソッドの使用
- csv出力：csvライブラリの使用
## タスク管理
- 要件定義シートにて機能の優先順位を設定
- 優先順位が高い機能において実装期日を設け、日々進捗管理を行う