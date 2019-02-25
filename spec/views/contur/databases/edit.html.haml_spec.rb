require 'rails_helper'

RSpec.describe "contur/databases/edit", type: :view do
  before do
    assign(:db, FactoryBot.create(:contur_database))
    render
  end

  describe "contains a edit form for a database" do
    it "header" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.contur/databases.edit.header"))
      expect(rendered).to have_selector('form', class: 'simple_form edit_contur_database')
    end
    it "edit form content" do
      assert_select "form" do
        assert_select "input[name='contur_database[url]']"
        assert_select "input[name='contur_database[vm_username]']"
        assert_select "input[name='contur_database[github_branch]']"
        assert_select "input[name='contur_database[server_id]']"
        assert_select "input[type='submit']"
      end
    end

    it "contains footer / buttons" do
      expect(rendered).to have_selector('h2', text: I18n.t("views.contur/databases.edit.footer"))
      expect(rendered).to have_css("input#delete_db_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
