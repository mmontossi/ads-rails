require 'test_helper'

class IncludeTagTest < ActionView::TestCase

  setup do
    self.request = OpenStruct.new(protocol: 'http://')
  end

  test 'adsense code' do
    Ads.config.renderer = nil
    with_env 'production' do
      tag = google_adsense_include_tag(client: 'pub-1234', width: 728)
      assert tag.include?("google_ad_client = 'pub-1234';\ngoogle_ad_width = 728;")
    end
  end

  test 'renderer' do
    Ads.config.renderer = lambda { |options|
      tag(
        :img,
        src: "http://placehold.it/#{options[:width]}x#{options[:height]}&text=Adsense"
      )
    }
    with_env 'development' do
      tag = google_adsense_include_tag(width: 728, height:90)
      assert tag.include?('src="http://placehold.it/728x90&amp;text=Adsense"')
    end
  end

  test 'gray div' do
    Ads.config.renderer = nil
    with_env 'development' do
      tag = google_adsense_include_tag(width: 728, height:90)
      assert tag.include?('style="width:728px;height:90px;background:#c8c8c8;"')
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
