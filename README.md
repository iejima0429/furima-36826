# テーブル設計

## users テーブル

| Column               | Type    | Option                      |
| -------------------- | --------| --------------------------- |
| nickname             | string  | null: folse, unique: true   |
| mail                 | string  | null: folse, unique: true   |
| password             | string  | null: folse                 |
| first_name           | string  | null: folse                 |
| first_name_kana      | string  | null: folse                 |
| last_name_kana       | string  | null: folse                 |
| birthday_year        | integer | null: folse                 |
| birthday_month       | integer | null: folse                 |
| birthday_days        | integer | null: folse                 |
### Association
has_many :items
has_many :buy
has_many :comments


## items テーブル

|Column               | Type       | Option                         |
|---------------------|------------|--------------------------------|
| item_name           | string     | null: folse                    |
| item_info           | text       | null: folse                    |
| item_category       | string     | null: folse                    |
| item_status         | string     | null: folse                    |
| item_delivery_free  | string     | null: folse                    |
| shipping_area       | string     | null: folse                    |
| days_to_ship        | integer    | null: folse                    |
| price               | integer    | null: folse                    |
| user                | reference  | null: folse, foreign_key: true |

### Association
belongs_to :user
belongs_to :buy
has_many   :comments

## buy テーブル

|Column                | Type      | Option                         |
|----------------------|--------------------------------------------|
| card_number          | integer   | null: folse                    |
| expiration_month     | integer   | null: folse                    |
| expiration_days      | integer   | null: folse                    |
| cvc                  | integer   | null: folse                    |
| post_number          | string    | null: folse                    |
| area                 | string    | null: folse                    |
| city_town_village    | string    | null: folse                    |
| address_number       | integer   | null: folse                    |
| buliding_name        | string    |                                |
| tel_number           | integer   | null: folse                    |
| item                 | reference | null: folse, foreign_key: true |

### Association
belongs_to :user
belongs_to :items

## comments テーブル

|Column    | Type      | Option                        |
|----------------------|------------------------------|
|content   | text      | null: folse                    |
|item      | reference | null: folse, foreign_key: true |
|user      | reference | null: folse, foreign_key: true |

### Association
belongs_to :user
belongs_to :item