require 'rails_helper'

RSpec.feature "Visitor navigates to Product details page", type: :feature, js: true do
  before :each do 
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        image: open_asset('apparel1.jpg'),
        price: 64.99
      )
    end
  end 


  scenario "They see all product details" do
    # ACT
    visit root_path
    first('article.product').find_link('Details').click
    # DEBUG / VERIFY
    sleep(5)
    expect(page).to have_css '.product-detail'
    save_screenshot 'testing.png'
  end

end