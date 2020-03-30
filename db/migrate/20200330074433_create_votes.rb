class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :account
      t.references :id
      t.boolean :upvote
      t.timestamps
    end
  end
end
