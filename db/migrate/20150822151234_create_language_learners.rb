class CreateLanguageLearners < ActiveRecord::Migration
  def change
    create_table :language_learners do |t|
      t.references :user, index: true
      t.references :language, index: true

      t.timestamps null: false
    end
  end
end
