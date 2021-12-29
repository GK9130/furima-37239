# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| user_image         | string |             |
| introduction       | text   |             |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy


##  destinationテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | -------------------------------|
| user_id          | integer | null: false, foreign_key: true |
| family_name      | string  | null: false                    |
| first_name       | string  | null: false                    |
| family_name_kana | string  | null: false                    |
| first_name_kane  | string  | null: false                    |
| post_code        | string  | null: false                    |
| prefecture       | string  | null: false                    |
| city             | string  | null: false                    |
| address          | string  | null: false                    |
| building_name    | string  | null: false                    |
| phone_number     | string  | null: false                    |

### Association

- belongs_to :user


##  cardテーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id     | integer | null: false, foreign_key: true |
| customer_id | string  | null: false                    |
| card_id     | string  | null: false                    |

### Association

- belongs_to :user


##  categoryテーブル

| Column   | Type   | Options     |
| ---------| ------ | ----------- |
| name     | string | null: false |
| ancestry | string |             |

### Association

- has_many :products


##  productテーブル

| Column           | Type    | Option                         |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | string  | null: false                    |
| description      | string  | null: false                    |
| status           | string  | null: false                    |
| size             | string  | null: false                    |
| shipping_cost    | string  | null: false                    |
| shipping_days    | string  | null: false                    |
| prefecture_id    | string  | null: false                    |
| judgment         | string  |                                |
| category_id      | integer | null: false, foreign_key: true |
| brand_id         | integer | null: false, foreign_key: true |
| shipping_id      | integer | null: false, foreign_key: true |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy

- belongs_to_active_hash :prefecture


##  imageテーブル

| Column     | Type    | Options                        |
| -----------| ------- | ------------------------------ |
| image      | string  | null: false                    |
| product_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :product


##  brandテーブル

| Column     | Type    | Options                        |
| -----------| ------- | ------------------------------ |
| name       | string  | index: true                    |


### Association

- has_many :products



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
