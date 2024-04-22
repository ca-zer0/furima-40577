# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| -----------------  | ------ | --------    |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_key    | string | null: false |
| first_name_key     | string | null: false |
| birthday           | date   | null: false |

has_many :items 
has_many :order


## items テーブル

| Column         | Type       | Options                        |
| ------         | -------    | -----------                    |
| name           | string     | null: false                    |
| describe       | text       | null: false                    |
| price          | integer    | null: false                    |
| user_id        | references | null: false, foreign_key :true |
| category_id    | integer    | null: false, foreign_key :true |


belongs_to :user 
belongs_to :category
has_one :order

## order テーブル

| user      | references  | null: false, foreign_key :true |
| item      | references  | null: false, foreign_key :true |

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column       | Type        | Options     |
| ------------ | ------      | ------      |
| post_code    | string      | null: false | 
| prefecture   | string      | null: false |
| city         | string      | null: false |
| street       | string      | null: false |
| building     | string      |             |
| phone_number | string      | null: false |

belongs_to :order



