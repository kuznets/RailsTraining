class AddRelationUserAndArticleToCommets < ActiveRecord::Migration[5.0]
  def change
  	change_table :comments do |t|
  		t.remove :commenter
  		t.references :user, foreign_key: true
  	end
  end
end
