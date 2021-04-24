# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false, unique: true|
| email              | string              | null: false, unique: true|
| encrypted_password | string              | null: false              |
| last_name          | string              | null: false              |
| first_name         | string              | null: false              |
| last_name_kana     | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birthday           | deta                | null: false              |

### Association

* has_many :items
* has_many :urchase_informations

## items table

| Column                              | Type       | Options                       |
|-------------------------------------|------------|-------------------------------|
| amount_ob_money                     | string     | null: false                   |
| user                                | references | null: false, foreign_key: true|
| description                         | text       | null: false                   |
| category                            | string     | null: false                   |
| status                              | string     | null: false                   |
| shipping_charges                    | string     | null: false                   |
| shipping_area                       | string     | null: false                   |
| shipping_days                       | string     | null: false                   |
| price                               | string     | null: false                   |

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
| prefectures                         | string     | null: false       |
| municipalities                      | string     | null: false       |
| address                             | string     | null: false       |
| building                            | string     |                   |
| tel                                 | string     | null: false       |
| purchase_information_id             | references | foreign_key: true |

### Association

- belongs_to :purchase_information
