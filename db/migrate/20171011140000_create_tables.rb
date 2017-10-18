class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.belongs_to :owner, polymorphic: true
      t.string :owner_name
      t.string :name
    end

    create_table :users do |t|
      t.string :login
    end

    create_table :organizations do |t|
      t.string :login
    end

    create_table :owner_groups do |t|
      t.string :uuid
      t.belongs_to :owner, polymorphic: true
      t.timestamps
    end

    create_table :env_vars do |t|
      t.belongs_to :owner, polymorphic: true
      t.string :name
      t.string :value
      t.boolean :private
    end

    create_table :settings do |t|
      t.belongs_to :owner, polymorphic: true
      t.string :key
      t.string :value
      t.datetime :expires_at
      t.text :comment
    end
  end
end
