# 沢登りのルート検索・情報収集できるアプリ

## サービス概要(三行で)

沢登りをしたい人が
全国、周辺のルートについて
簡単に情報収集できるサービス

## メインのターゲット

- 登山家
- 釣り人

## ユーザーの抱える課題

沢登りのルートを検索するのが困難、
また、ルートについて情報収取が難しい。

## 解決方法

有名なルート一覧を GoogleMaps 上で表示、各ルートの詳細情報(難易度、距離など)を載せることで、簡単に検索・情報収集できるようにする。

## 実装予定の機能

### RUNTEQ 内リリース(MVP)

- ルート検索
  - GoogleMap でルート一覧をピンで表示(東海)
  - 地名でのルート絞り込み
- ルート詳細情報
  - 登山口からゴールまでの詳細のルートを GoogleMap 上に表示
  - API でルートの活動日記を取得
  - ルート情報の CRUD

### 本リリース

- GoogleMap でルート一覧を表示(東海＋関東)
- おすすめルートの表示
- ルートで必要な装備を表示
- 釣りができるか表示
- ルートのお気に入り機能

## 使用予定技術

MapBox API

## なぜこのサービスを作りたいか？

ルート情報を集めやすいサイトがあれば、より安全に沢登りを楽しめると思ったからです。
　登山において情報収集は事故を減らすために、絶対に必要なことです。
　私自身沢登りを始めようと情報収集しましたが、個人の活動日記、ブログ等での紹介が殆どで、初心者におすすめのルートなどを検索するのが大変でした。
登山で有名なアプリ YAMAP は沢登りのルート検索機能はなく、個人の活動日記を参考にするしかないのが現状です。
　沢登りは登山より危険を伴い、より綿密に情報収集をしないといけません。
そのため、YAMAP のような基準となる情報源があれば良いなと思い、このサービスを作成しようと決めました。

## スケジュール

README 〜　 ER 図の作成：2/28 〆切
メイン機能実装：3/1 〜 3/21
β 版を RUNTEQ 内リリース（MVP）：3/21 〆切
本番リリース：4/1

# 画面遷移図

https://www.figma.com/file/0WYYvV6ieTBIqxrKTTCnv9/%E6%B2%A2%E7%99%BB%E3%82%8A?node-id=0%3A1

# ER 図

https://drive.google.com/file/d/1MkZwRFpgUuK0bhSQZtCpI2ib2jWlHD2H/view?usp=sharing
