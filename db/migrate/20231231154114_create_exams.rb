class CreateExams < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :university

      t.timestamps
    end
  end
end
