class CreateShortenedUrLs < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, null: false
      t.index :short_url
      t.string :long_url, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
