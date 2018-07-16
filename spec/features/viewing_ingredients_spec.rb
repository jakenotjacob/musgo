feature "Users can view ingredients" do
  scenario "with ingredient details" do
    ingredient = FactoryBot.create(:ingredient, name: 'Ketchup')

    visit "/"
    click_link "Ingredients"
    click_link "Ketchup"
    expect(page.current_url).to eq ingredient_url(ingredient)
  end
end
