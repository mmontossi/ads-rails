require 'test_helper'

class IncludeTagTest < ActionView::TestCase

  setup do
    self.request = OpenStruct.new(protocol: 'http://')
  end

  test "show adsense code if env is production and there is no renderer" do
    ::Rails.application.config.ads.renderer = nil
    with_env 'production' do
      assert_equal(
        %Q(<script type="text/javascript">google_ad_client = 'pub-1234';\ngoogle_ad_width = 728;\n</script>) +
        %Q(<script src="http://pagead2.googlesyndication.com/pagead/show_ads.js" type="text/javascript"></script>),
        google_adsense_include_tag(client: 'pub-1234', width: 728)
      )
    end
  end
  
  test "show renderer output if env is not production and there is a renderer" do
    ::Rails.application.config.ads.renderer = lambda { |options|
      tag(
        :img,
        src: "http://placehold.it/#{options[:width]}x#{options[:height]}&text=Adsense"
      )
    }
    with_env 'development' do
      assert_equal(
        '<img src="http://placehold.it/728x90&amp;text=Adsense" />',
        google_adsense_include_tag(width: 728, height:90)
      )
    end
  end

  test "show gray div if env is not production and there is no renderer" do
    ::Rails.application.config.ads.renderer = nil
    with_env 'development' do
      assert_equal(
        '<div style="width:728px;height:90px;background:#c8c8c8;"></div>',
        google_adsense_include_tag(width: 728, height:90)
      )
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
