require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Check if add to cart adds" do
    # ACT
    visit root_path
    test = true;
    i = 0;

    # DEBUG / VERIFY
    size = page.all('footer.actions .btn-primary').length

    while i < size
      page.all('footer.actions .btn-primary')[i].click
      if page.all('.navbar-right li a').last.text != "My Cart (#{i+1})"
        test = false
      end
      i += 1
    end


    expect(test).to be_truthy
  end
end
