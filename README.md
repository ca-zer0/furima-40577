# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                                                                                      |
| -----------------  | ------ | -----------                                                                                  |
| email              | string | null: false, unique: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}             |
| encrypted_password | string | null: false, length: { minimum: 6}, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } |
| nickname           | string | null: false                                                                                  |
| family_name        | string | null: false, with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}                       |
| first_name         | string | null: false, with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}                       |
| family_name_key    | string | null: false, with_options format: { with: /\A[ァ-ヶー]+\z/}                                  |
| first_name_key     | string | null: false, with_options format: { with: /\A[ァ-ヶー]+\z/}                                  |
| birthday           | date   | null: false                                                                                  |

has_many :items dependent: :destroy
has_many :order


## items テーブル

| Column         | Type       | Options                                      |
| ------         | -------    | ------------------------------               |
| name           | string     | null: false                                  |
| describe       | text       | null: false                                  |
| price          | integer    | null: false, format: { with: /\A[0-9]+\z/} do numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999} |
| user_id        | references | null: false, foreign_key :true               |

belongs_to :user dependent: :destroy
belongs_to_active_hash :category
has_one :order

## categories テーブル

| category_id    | integer    | null: false, numericality: { other_than: 1 } |
| condition_id   | integer    | null: false, numericality: { other_than: 1 } |
| deli_charge_id | integer    | null: false, numericality: { other_than: 1 } |
| region_id      | integer    | null: false, numericality: { other_than: 1 } |
| deli_time_id   | integer    | null: false, numericality: { other_than: 1 } |

has_many :items

## order テーブル

| user      | references  | null: false, foreign_key :true |
| item      | references  | null: false, foreign_key :true |

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column       | Type        | Options                                           |
| ------------ | ------      | -----------                                       |
| post_code    | integer     | null: false, format: { with: /\A\d{3}[-]\d{4}\z/ }| 
| prefecture   | string      | null: false                                       |
| city         | string      | null: false                                       |
| street       | string      | null: false                                       |
| building     | string      | null: false                                       |
| phone_number | integer     | null: false, format: { with: /\A\d{10,11}\z/ }    |

belongs_to :order



