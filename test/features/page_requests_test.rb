require_relative "./feature_test_helper"

class PageRequests < FeatureTest
  def test_random_url_redirects_to_error_page
    visit '/lakjdf'
    assert page.has_content?('Error')
  end

  def test_homepage
    visit '/'
    assert page.has_selector?("img[src='/images/twofisted.png']")
  end

  def test_phone_page
    visit '/phone'
    assert page.has_selector?("span[class='giant']")
  end

  def test_what_page
    visit '/what'
    assert page.has_content?('PDF')
  end

  def test_when_page
    visit '/when'
    assert page.has_css?('span.red')
  end

  def test_where_page
    visit '/where'
    assert page.has_selector?("img[src='/images/map.gif']")
  end

  def test_who_page
    visit '/who'
    assert page.has_css?('h1')
  end
end
