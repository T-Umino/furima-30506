## usersテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| nickname       | string     | null: false |
| email          | string     | null: false |
| password       | string     | null: false |
| last_name      | string     | null: false |
| first_name     | string     | null: false |
| last_name_kana | string     | null: false |
| first_name_kana| string     | null: false |
| birth_year_id  | integer    | null: false |
| birth_month_id | integer    | null: false |
| birth_day_id   | integer    | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :transactions
- has_one_active_hash :birth_year
- has_one_active_hash :birth_month
- has_one_active_hash :birth_day

## itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| duration_id  | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| price        | integer    | null: false                    |

### Association
- belongs_to :user
- has_many :comments
- has_one_active_hash :category
- has_one_active_hash :condition
- has_one_active_hash :duration
- has_one :transaction

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## transactionsテーブル

| Column     | Type       | Options                        |
| ---------- | -------    | ------------------------------ |
| price      | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address

## addressesテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| prefecture_id | integer | null: false |
| municipality  | string  | null: false |
| building_name | string  | none        |
| details       | string  | null: false |
| tel           | string  | null: false |

### Association
- has_one :transaction