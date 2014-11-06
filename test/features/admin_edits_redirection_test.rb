require_relative "./feature_test_helper"

class AdminEditsRedirection < FeatureTest
  def test_admin_homepage
    visit '/admin'
    assert page.has_submit_button?('Submit')
  end

  def test_admin_phone_page
    visit '/admin_phone'
    assert page.has_submit_button?('Submit')
  end

  def test_admin_what_page
    visit '/admin_what'
    assert page.has_submit_button?('Submit')
  end

  def test_admin_when_page
    visit '/admin_when'
    assert page.has_submit_button?('Submit')
  end

  def test_admin_where_page
    visit '/admin_where'
    assert page.has_submit_button?('Submit')
  end

  def test_admin_why_page
    visit '/admin_why'
    assert page.has_submit_button?('Submit')
  end

  def test_admin_who_page
    visit '/admin_who'
    assert page.has_submit_button?('Submit')
  end
end
