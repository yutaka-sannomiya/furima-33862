# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| email              | string              | null: false, unique: true|
| encrypted_password | string              | null: false              |
| last_name          | string              | null: false              |
| first_name         | string              | null: false              |
| last_name_kana     | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birthday           | date                | null: false              |

### Association

* has_many :items
* has_many :purchase_informations

## items table

| Column                              | Type       | Options                       |
|-------------------------------------|------------|-------------------------------|
| product_name                        | string     | null: false                   |
| user                                | references | null: false, foreign_key: true|
| description                         | text       | null: false                   |
| category_id                         | integer    | null: false                   |
| status_id                           | integer    | null: false                   |
| shipping_charge_id                  | integer    | null: false                   |
| shipping_area_id                    | integer    | null: false                   |
| shipping_day_id                     | integer    | null: false                   |
| price                               | integer    | null: false                   |

### Association

- belongs_to :user
* has_one :purchase_information

## purchase_informations table

| Column                              | Type       | Options                       |
|-------------------------------------|------------|-------------------------------|
| user                                | references | null: false, foreign_key: true|
| item                                | references | null: false, foreign_key: true|

### Association

* has_one :delivery
- belongs_to :item
- belongs_to :user

## deliverys table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal_code                         | string     | null: false       |
| shipping_area_id                    | integer    | null: false       |
| municipalities                      | string     | null: false       |
| address                             | string     | null: false       |
| building                            | string     |                   |
| tel                                 | string     | null: false       |
| purchase_information                | references | foreign_key: true |

### Association

- belongs_to :purchase_information
