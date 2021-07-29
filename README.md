# テーブル設計

## usersテーブル

| column               | type   | Options                   |
| -------------------- | ------ | ------------------------- |
| name                 | string | null: false               |
| email                | string | null: false unique: true  |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| family_name          | string | null: false               |
| read_first           | string | null: false               |
| read_family          | string | null: false               |
| birth_day            | date   | null: false               |


### Association

- has_many :items
- has_many :orders

## itemsテーブル

| column                | type          | Options                       |
| --------------------- | ------------- | ----------------------------- |
| name                  | string        | null: false                   |
| price                 | integer       | null: false                   |
| deliv_fee_burden_id   | integer       | null: false                   |
| item_description      | text          | null: false                   |
| category_id           | integer       | null: false                   |
| status_id             | integer       | null: false                   |
| shipping_area_id      | integer       | null: false                   |
| deliv_averagetime_id  | integer       | null: false                   |
| user                  | references    | null: false foreign_key: true |

### Association

- belong_to :user
- has_one   :order
- belong_to_active_hash :deliv_fee_burden_id
- belong_to_active_hash :category_id
- belong_to_active_hash :status_id
- belong_to_active_hash :shipping_area_id
- belong_to_active_hash :deliv_averagetime_id

## Ordersテーブル

| column    | type          | Options                       |
| --------- | ------------- | ----------------------------- |
| user      | references    | null: false foreign_key: true |
| item      | references    | null: false foreign_key: true |

### Association

- belong_to :user
- belong_to :item
- has_one :deliv_addresses

## deliv_addressesテーブル

| column          | type          | Options                       |
| --------------- | ------------- | ----------------------------- |
| postal_code     | string        | null: false                   |
| prefecture_id   | integer       | null: false                   |
| city            | string        | null: false                   |
| address         | string        | null: false                   |
| building_name   | string        |                               |
| phone_number    | string        | null: false                   |
| order           | references    | null: false foreign_key: true |

### Association

- belong_to: order
- belong_to_active_hash :prefecture_id