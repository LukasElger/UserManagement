require 'rails_helper'

RSpec.describe "contur/databases/new", type: :view do
  before do
    assign(:db, Contur::Database.new)
    render
  end

  describe "contains a creation form for a database" do
    it "header" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.contur/databases.new.header"))
      expect(rendered).to have_selector('form', class: 'simple_form new_contur_database')
    end
    it "new form content" do
      assert_select "form" do
        assert_select "input[name='contur_database[url]']"
        assert_select "input[name='contur_database[vm_username]']"
        assert_select "input[name='contur_database[github_branch]']"
        assert_select "select[name='contur_database[server_id]']"
        assert_select "input[type='submit']"
      end
    end

    it "contains buttons" do
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
