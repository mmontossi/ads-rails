require 'test_helper'

class HelperTest < ActionView::TestCase
  include Ads::Rails::Extensions::ActionView::Base

  test 'tag' do
    self.request = ActionDispatch::TestRequest.new({})

    with_env 'production' do
      tag = google_adsense_include_tag(client: 'pub-1234', width: 728)
      assert_includes tag, %Q(google_ad_client = "pub-1234";\ngoogle_ad_width = 728;)
    end

    with_env 'development' do
      tag = google_adsense_include_tag(width: 728, height: 90)
      assert_includes tag, 'style="width: 728px; height: 90px; background: #c8c8c8;"'
    end
  end

  private

  def with_env(value)
    old_env = Rails.env
    Rails.env = value
    yield
    Rails.env = old_env
  end

end
