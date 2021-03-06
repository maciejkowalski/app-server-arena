require 'bundler'
Bundler.setup(:default)

require 'active_record'
require 'logger'
require_relative 'user'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'tmp/db')

ActiveRecord::Schema.define do
  drop_table :users
  create_table :users do |t|
    t.string :name
    t.string :email
  end

  drop_table :comments
  create_table :comments do |t|
    t.integer :post_id
  end
end

1000.times do |i|
  User.create(name: "name_#{i}", email: "name_#{i}@example.com")
end
