feature "Users can create new ingredients" do
  before do
    visit "/"
    click_link "Ingredients"
    click_link "New Ingredient"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Ketchup"
    fill_in "Description", with: "This stuff is for fries!"
    click_button "Create Ingredient"

    ingredient = Ingredient.find_by(name: 'Ketchup')
    expect(page.current_url).to eq ingredient_url(ingredient)

    title = "Ketchup - Ingredients - Mustgo"
    expect(page).to have_title title

    expect(page).to have_content "Ingredient has been created."
  end

  scenario "with invalid attributes" do
    click_button "Create Ingredient"

    expect(page).to have_content "Ingredient has not been created."
    expect(page).to have_content "Name can't be blank"
    #We'll keep description optional for now...
  end
end

