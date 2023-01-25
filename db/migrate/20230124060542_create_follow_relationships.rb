class CreateFollowRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_relationships do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :followed, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :follow_relationships, :follower
    add_index :follow_relationships, :followed
    add_index :follow_relationships, [:follower_id, :followed_id], unique: true
  end
end
