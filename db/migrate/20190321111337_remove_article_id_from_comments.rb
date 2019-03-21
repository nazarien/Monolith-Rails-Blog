class RemoveArticleIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_reference :comments, :article, index: true, foreign_key: true
  end
end
