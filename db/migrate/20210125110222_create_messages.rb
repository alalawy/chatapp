class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :idConversation
      t.string :idSender
      t.string :message
      t.string :messageType
      t.integer :status

      t.timestamps
    end
  end
end
