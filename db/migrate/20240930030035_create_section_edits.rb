class CreateSectionEdits < ActiveRecord::Migration[5.1]
  def up
    create_table :section_edits do |t|
      t.references :admin_user #reference to AdminUser
      t.references :section  # reference to section 
      t.string "summary"
      t.timestamps
    end
    add_index :section_edits, ["admin_user_id", "section_id"]
  end

  def down 
    drop_table :section_edits
  end
end
