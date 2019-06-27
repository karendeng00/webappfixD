class AddFieldsToIssue < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :email, :string
    add_column :issues, :phone, :string
    add_column :issues, :alternate_phone, :string
    add_column :issues, :group, :string
    add_column :issues, :urgency, :string
    add_column :issues, :impact, :string
    add_column :issues, :sensitive_info, :text
    add_column :issues, :campus, :string
    add_column :issues, :area, :string
    add_column :issues, :specific_location, :string
    add_column :issues, :room_number, :string
    add_column :issues, :service_animal, :boolean
    add_column :issues, :your_building, :string
    add_column :issues, :your_floor, :string
    add_column :issues, :your_room, :string
    add_column :issues, :request_type, :string
    add_column :issues, :issue_building, :string
    add_column :issues, :issue_floor, :string
    add_column :issues, :issue_room, :string
    add_column :issues, :service_type, :string
    add_column :issues, :fund_code, :string
    add_column :issues, :topic, :string
  end
end
