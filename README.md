# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false, unique: true|
| email              | string              | null: false, unique: true|
| password           | string              | null: false              |
| last_name          | text                | null: false              |
| first_name         | text                | null: false              |
| last_name_kana     | text                | null: false              |
| first_name_kana    | text                | null: false              |
| year               | text                | null: false              |
| month              | text                | null: false              |
| day                | text                | null: false              |

### Association

* has_many :items
* has_one  :urchase_informations

## items table

| Column                              | Type       | Options                       |
|-------------------------------------|------------|-------------------------------|
| image                               |            |                               |
| amount_ob_money                     | text       | null: false                   |
| user                                | references | null: false, foreign_key: true|
| description                         | text       | null: false                   |
| category                            | text       | null: false                   |
| status                              | text       | null: false                   |
| shipping_charges                    | text       | null: false                   |
| shipping_area                       | text       | null: false                   |
| shipping_days                       | text       | null: false                   |
| price                               | text       | null: false                   |

### Association

- belongs_to :user
* has_one :purchase_informations

## purchase_informations table

| Column                              | Type       | Options                       |
|-------------------------------------|------------|-------------------------------|
| user                                | references | null: false, foreign_key: true|
| item                                | references | null: false, foreign_key: true|

### Association

* has_one :deliverys
- belongs_to :item
- belongs_to :user

## deliverys table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal_code                         | text       | null: false       |
| prefectures                         | text       | null: false       |
| municipalities                      | text       | null: false       |
| address                             | text       | null: false       |
| building                            | text       |                   |
| tel                                 | text       | null: false       |

### Association

- belongs_to :purchase_information
