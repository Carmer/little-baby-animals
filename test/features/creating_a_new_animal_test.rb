require_relative "../test_helper"

class TestAnimalCreationFeature < ActionDispatch::IntegrationTest

  def test_a_user_can_create_a_new_animal
    visit "/"

    click_link "Create a new little baby animal"

    # assert_equal "/animals/new", current_path
    assert_equal new_animal_path, current_path

    fill_in "animal[name]", with: "Turtle-Bear"
    # fill_in "animal[description]" with: "Big furry with a hard shell"
    fill_in "Description", with: "Big furry with a hard shell"
    fill_in "Age", with: 1
    click_button "Create new animal"

    assert page.has_css? "#animal_details"

    within("#animal_details") do
      assert page.has_content? "Name: Turtle-Bear"
      assert page.has_content? "Description: Big furry with a hard shell"
      assert page.has_content? "Age: 1"
    end
  end
end
