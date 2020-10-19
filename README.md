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
| birth_day      | date       | null: false |

### Association 
- has_many :items
- has_many :comments
- has_many :purchases

## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    |
| duration_id    | integer    | null: false                    |
| ship_fee_id    | integer    | null: false                    |
| ship_source_id | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| price          | integer    | null: false                    |

### Association
- belongs_to :user
- has_many :comments
- has_one_active_hash :category
- has_one_active_hash :condition
- has_one_active_hash :duration
- has_one_active_hash :ship_fee
- has_one_active_hash :ship_source
- has_one :purchase

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## purchasesテーブル

| Column     | Type       | Options                        |
| ---------- | -------    | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column         | Type       | Options                           |
| -------------- | ---------- | --------------------------------- |
| postal_code    | string     | null: false                       |
| prefecture_id  | integer    | null: false                       |
| municipality   | string     | null: false                       |
| building_name  | string     | none                              |
| details        | string     | null: false                       |
| tel            | string     | null: false                       |
| purchase       | references | null: false, foreign_key: true    |

### Association
- belongs_to :purchase