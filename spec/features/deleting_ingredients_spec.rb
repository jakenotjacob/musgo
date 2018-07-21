feature "Users can delete ingredients" do
  scenario "successfully" do
    FactoryBot.create(:ingredient, name: "Ketchup")

    visit "/"
    click_link "Ingredients"
    click_link "Ketchup"
    click_link "Delete Ingredient"

    expect(page).to have_content "Ingredient has been deleted."
    expect(page.current_url).to eq ingredients_url
    expect(page).to have_no_content "Ketchup"
  end
end
