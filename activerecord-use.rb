# 1 создать базу данных

set :database, "sqlite3:barbershop.db"

# 2 создать сущность


class Client < ActiveRecord::Base

end

# 3 Создать файл Rake

require './app'
require 'sinatra/activerecord/rake'

# 4 Через консоль создать миграцию

rake -T

rake db:create_migration NAME=create_clients

# Создастся файл в папке /db/migrate туда вносим создание таблиц и вносим строки

class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.text :name
      t.timestamps null: true
    end

    Client.create :name => 'Jassie Pinkman'
    Client.create :name => 'Walter White'
    Client.create :name => 'Gus Frig'
    
    # или можно по другому
    
    b = Client.new :name => 'Mike 2'
    b.save
    
  end
end

# 5 Запускаем создание таблиц в консоле

rake db:migrate

