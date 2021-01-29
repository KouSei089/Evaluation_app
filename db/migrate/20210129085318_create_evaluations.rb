class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.string :title
      t.string :services
      t.string :language
      t.text :description
      t.timestamps
    end
  end
end
