class AddUserRefToPictures < ActiveRecord::Migration[6.0]
  def change
    add_reference :pictures, :record, polymorphic: true, index: true
  end
end
