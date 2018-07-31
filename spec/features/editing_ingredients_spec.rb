feature "Users can edit existing ingredients" do
  before do
    FactoryBot.create(:ingredient, name: "Ketchup", description: "I am a ketchup note!")
    visit "/"
    click_link "Ingredients"
    click_link "Ketchup"
    click_link "Edit Ingredient"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "Ketchup Revamped"
    click_button "Update Ingredient"

    expect(page).to have_content "Ingredient has been updated."
    expect(page).to have_content "Ketchup Revamped"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Ingredient"

    expect(page).to have_content "Ingredient has not been updated."
  end
end

