# README

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

# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| family_name     | string  | null: false |
| first_name      | string  | null: false |
| kana_family_name| string  | null: false |
| kana_first_name | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buyers

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| image           | text    | null: false |
| explanation     | string  | null: false |
| category        | string  | null: false |
| status          | integer | null: false |
| price           | integer | null: false |
| delivery_fee    | integer | null: false |
| shipping_origin | integer | null: false |
| delivery_date   | integer | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :buyer

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## shipping_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone         | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer