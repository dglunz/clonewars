require_relative "./feature_test_helper"

class AdminEditsPages < FeatureTest
  def test_phone_page_headline
    visit '/phone'
    assert page.has_content?("For a good time:")

    visit '/admin_phone'
    fill_in('headline', with: 'Call me maybe?')
    click_button('Submit')

    visit '/phone'
    assert page.has_content?('Call me maybe?')
  end

  def test_phone_page_giant_text
    visit '/phone'
    assert page.has_content?("303-623-3523")

    visit '/admin_phone'
    fill_in('giant', with: '1-800-555-5555')
    click_button('Submit')

    visit '/phone'
    assert page.has_content?('1-800-555-5555')
  end

  def test_empty_content_creates_an_empty_cell
    visit '/admin_when'
    fill_in('heading', with: '')
    click_button('Submit')

    visit '/when'
    assert_equal '', find(:css, 'h1').text
  end
end
