require "rails_helper"

RSpec.feature "Users can create new ingredients" do
  scenario "with valid attributes" do
    visit "/"
    click_link "Ingredients"
    click_link "New Ingredient"

    fill_in "Name", with: "Ketchup"
    fill_in "Description", with: "This stuff is for fries!"
    click_button "Create Ingredient"

    ingredient = Ingredient.find_by(name: 'Ketchup')
    expect(page.current_url).to eq ingredient_url(ingredient)

    title = "Ketchup - Ingredients - Mustgo"
    expect(page).to have_title title

    expect(page).to have_content "Ingredient has been created."
  end
end
