class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.text :inputs
      t.text :output
      t.integer :mind_id

      t.timestamps
    end
  end
end
