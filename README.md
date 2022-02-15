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
有名なルート一覧をGoogleMaps上で表示、各ルートの詳細情報(難易度、距離など)を載せることで、簡単に検索・情報収集できるようにする。
## 実装予定の機能
### RUNTEQ内リリース(MVP)
- ルート検索
  - GoogleMapでルート一覧をピンで表示(東海)
  - 地名でのルート絞り込み
- ルート詳細情報
  - 登山口からゴールまでの詳細のルートをGoogleMap上に表示
  - APIでルートの活動日記を取得
  - ルート情報のCRUD
### 本リリース
- GoogleMapでルート一覧を表示(東海＋関東)
- おすすめルートの表示
- ルートで必要な装備を表示
- 釣りができるか表示
- ルートのお気に入り機能
## 使用予定技術
Google Map API
ヤマレコ Web API
## なぜこのサービスを作りたいか？
　ルート情報を集めやすいサイトがあれば、より安全に沢登りを楽しめると思ったからです。
　登山において情報収集は事故を減らすために、絶対に必要なことです。
　私自身沢登りを始めようと情報収集しましたが、個人の活動日記、ブログ等での紹介が殆どで、初心者におすすめのルートなどを検索するのが大変でした。
登山で有名なアプリYAMAPは沢登りのルート検索機能はなく、個人の活動日記を参考にするしかないのが現状です。
　沢登りは登山より危険を伴い、より綿密に情報収集をしないといけません。
そのため、YAMAPのような基準となる情報源があれば良いなと思い、このサービスを作成しようと決めました。
## スケジュール
README 〜　ER図の作成：2/28〆切
メイン機能実装：3/1 〜 3/21
β版をRUNTEQ内リリース（MVP）：3/21〆切
本番リリース：4/1
