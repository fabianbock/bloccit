class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, index: true, foreign_key: true
      t.boolean :public, default: true
      t.timestamps null: false
    end
  end
end
