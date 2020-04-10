class AddReadedAtToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :readed_at, :datetime
  end
end
