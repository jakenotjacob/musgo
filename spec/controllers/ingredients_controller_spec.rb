require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  it "handles a missing ingredient correctly" do
    #HTTP request method keyword args change... no longer can pass just "id: 'not-here'", need param specifier
    get :show, params: { id: "not-here" }

    expect(response).to redirect_to(ingredients_path)

    message = "The ingredient you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end

end

