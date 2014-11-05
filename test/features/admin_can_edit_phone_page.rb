require_relative "./feature_test_helper"

class AdminEditsPhonePage < FeatureTest
  def test_phone_page_start
    visit "/phone"
    assert page.has_content?("For a good time:")
  end
end
