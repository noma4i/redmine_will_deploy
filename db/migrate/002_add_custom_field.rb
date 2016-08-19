class AddCustomField < ActiveRecord::Migration
  def self.up
    cf = CustomField.create!(
      name: "Deploy?",
      field_format: "list",
      is_required: false,
      is_for_all: true,
      is_filter: true,
      searchable: false,
      editable: true,
      visible: false,
      multiple: false,
      regexp: "",
      possible_values: ["Yes", "No"],
      default_value: "No",
      format_store: {:url_pattern=>"", :edit_tag_style=>""}
    )
    cf.update_column(:type, "IssueCustomField")
  end

  def self.down
  end
end
