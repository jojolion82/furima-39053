# furima-39053

## usersテーブル
| Column               | Type   | Option      | 
| -------------------- | ------ | ----------- | 
| nickname             | string | null: false | 
| email                | string | null: false | 
| encrypted_password   | string | null: false | 
| last_name            | string | null: false | 
| first_name           | string | null: false | 
| last_name_kana       | string | null: false | 
| first_name_kana      | string | null: false | 
| birthday             | date   | null: false | 

### Association

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル
| Column           | Type       | Option            | 
| ---------------- | ---------- | ----------------- | 
| name             | string     | null: false       | 
| text             | text       | null: false       | 
| category_id      | integer    | null: false       | 
| status_id        | integer    | null: false       | 
| delivery_id      | integer    | null: false       | 
| prefecture_id    | integer    | null: false       | 
| delivery_days_id | integer    | null: false       | 
| price            | integer    | null: false       | 
| user             | references | foreign_key: true | 

### Association

- has_many :comments
- belongs_to :user
- has_one :order

## ordersテーブル
| Column  | Type       | Option            | 
| ------- | ---------- | ----------------- | 
| user    | references | foreign_key: true | 
| item    | references | foreign_key: true | 

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル
| Column        | Type       | Option            | 
| ------------- | ---------- | ----------------- | 
| postcode      | string     | null: false       | 
| prefecture_id | integer    | null: false       | 
| city          | string     | null: false       | 
| block         | string     | null: false       | 
| building      | string     |                   | 
| phone_number  | string     | null: false       | 
| order         | references | foreign_key: true | 

### Association

- belongs_to :order

## commentsテーブル
| Column  | Type       | Option            | 
| ------- | ---------- | ----------------- | 
| text    | string     | null: false       | 
| user    | references | foreign_key: true | 
| item    | references | foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
