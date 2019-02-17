# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# DB設計
##2月12日時点

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|uid|string||
|provider|string||

### Association
- has_many :blogs

## blogsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|user_id|references|null: false, foreign_key: true|

### Association
- belong_to :user
