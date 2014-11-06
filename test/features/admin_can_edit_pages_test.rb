require_relative "./feature_test_helper"

class AdminEditsPages < FeatureTest

  def test_phone_page_headline
    visit '/phone'
    assert page.has_content?('For a good time:')

    visit '/admin_phone'
    fill_in('headline', with: 'Call me maybe?')
    click_button('Submit')
    assert page.has_input?('Call me maybe?')

    visit '/phone'
    assert page.has_content?('Call me maybe?')
  end

  def test_phone_page_giant_text
    visit '/phone'
    assert page.has_content?('303-623-3523')

    visit '/admin_phone'
    fill_in('giant', with: '1-800-555-5555')
    click_button('Submit')
    assert page.has_input?('1-800-555-5555')

    visit '/phone'
    assert page.has_content?('1-800-555-5555')
  end

  def test_empty_content_creates_an_empty_cell
    visit '/admin_when'
    fill_in('headline', with: '')
    click_button('Submit')
    assert page.has_input?('')

    visit '/when'
    assert_equal '', find(:css, 'h1').text
    refute page.has_content?('day of the week')
  end

  def test_extra_content_does_not_break_or_show
    visit '/admin_where'
    fill_in('headline', with: '1600 Pennsylvania Avenue NW')
    fill_in('giant', with: 'I CANT BELIEVE ITS NOT BUTTER')
    click_button('Submit')
    assert page.has_input?('I CANT BELIEVE ITS NOT BUTTER')

    visit '/where'
    assert page.has_content?('Pennsylvania')
    refute page.has_content?('BUTTER')
  end

  def test_why_page_note
    visit '/why'
    assert page.has_content?('what else is there really?')

    visit '/admin_why'
    fill_in('headline', with: 'for the lolz')
    fill_in('note', with: 'a lot more little notes')
    click_button('Submit')
    assert page.has_input?('a lot more little notes')

    visit '/why'
    assert page.has_content?('a lot more little notes')
    refute page.has_content?('what else is there really?')
  end

  def test_who_page
    visit '/who'
    assert page.has_content?('potato cannons')

    visit '/admin_who'
    fill_in('headline', with: 'ketchup')
    fill_in('bodytext', with: 'mustard')
    click_button('Submit')
    assert page.has_input?('ketchup')
    assert page.has_content?('mustard')

    visit '/who'
    assert page.has_content?('mustard')
    refute page.has_content?('potato')
  end
end
