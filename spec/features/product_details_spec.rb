require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do
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
  scenario "They see all product pages for products" do
    # ACT
    visit root_path
    test = true;
    i = 0;

    # DEBUG / VERIFY
    urls = page.all('footer a.pull-right').map { |a| a['href'] }

    while i < urls.size
      visit urls[i]
      if page.status_code != 200
        test = false
      end
      p  i
      i += 1
    end

    expect(test).to be_truthy
  end
end
