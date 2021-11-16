# テーブル設計

## users テーブル

| Column               | Type    | Option                      |
| -------------------- | --------| --------------------------- |
| nickname             | string  | null: false                 |
| email                | string  | null: false, unique: true   |
| encrypted_password   | string  | null: false                 |
| first_name           | string  | null: false                 |
| last_name            | string  | null: false                 |
| first_name_kana      | string  | null: false                 |
| last_name_kana       | string  | null: false                 |
| birthday             | date    | null: false                 |
### Association
has_many :items
has_many :buys
has_many :comments


## items テーブル

|Column                  | Type       | Option                         |
|------------------------|------------|--------------------------------|
| item_name              | string     | null: false                    |
| item_info              | text       | null: false                    |
| item_category_id       | integer    | null: false                    |
| item_status_id         | integer    | null: false                    |
| item_delivery_free_id  | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| days_to_ship_id        | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one    :sold_out
has_many   :comments


## buys テーブル

|Column                | Type       | Option                         |
|----------------------|------------|--------------------------------|
| post_number          | string     | null: false                    |
| shipping_area_id     | integer    | null: false                    |
| city_town_village    | string     | null: false                    |
| address_number       | string     | null: false                    |
| buliding_name        | string     |                                |
| tel_number           | string     | null: false                    |
| sold_out             | references | null: false, foreign_key: true |

### Association
belongs_to :sold_out

## comments テーブル

|Column    | Type       | Option                         |
|-----------------------|--------------------------------|
|content   | text       | null: false                    |
|item      | references | null: false, foreign_key: true |
|user      | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item

## sold_outs テーブル

|Column   | Type       | Option                         |
|---------|------------|--------------------------------|
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one    :buy
