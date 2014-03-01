require 'test_helper'

class IncludeTagTest < ActionDispatch::IntegrationTest

  test "should show adsense code if env is production and there is no renderer" do
    assert ::Rails.application.config.ads.renderer.nil?
    with_env 'production' do
      get '/'
      assert_response :success
      assert response.body.include?("<script type=\"text/javascript\">google_ad_client = 'client';\ngoogle_ad_slot = 'slot';\ngoogle_ad_width = 728;\ngoogle_ad_height = 90;\n</script>")
      assert response.body.include?('<script src="http://pagead2.googlesyndication.com/pagead/show_ads.js" type="text/javascript">')
    end
    with_env 'production' do
      https!
      get '/'
      assert_response :success
      assert response.body.include?("<script type=\"text/javascript\">google_ad_client = 'client';\ngoogle_ad_slot = 'slot';\ngoogle_ad_width = 728;\ngoogle_ad_height = 90;\n</script>")
      assert response.body.include?('<script src="https://pagead2.googlesyndication.com/pagead/show_ads.js" type="text/javascript">')
    end
  end
  
  test "should show renderer output if env is not production and there is a renderer" do
    with_env 'development' do
      ::Rails.application.config.ads.renderer = lambda { |options| content_tag :script, "client = '#{options[:client]}';\nslot = '#{options[:slot]}';\nwidth = #{options[:width]};\nheight = #{options[:height]};".html_safe }
      get '/'
      assert_response :success
      assert response.body.include?("<script>client = 'client';\nslot = 'slot';\nwidth = 728;\nheight = 90;</script>")
    end
    with_env 'development' do
      ::Rails.application.config.ads.renderer = proc { |options| content_tag :script, "<script>client = '#{options[:client]}';\nslot = '#{options[:slot]}';\nwidth = #{options[:width]};\nheight = #{options[:height]};".html_safe }
      get '/'
      assert_response :success
      assert response.body.include?("<script>client = 'client';\nslot = 'slot';\nwidth = 728;\nheight = 90;</script>")
    end
  end

  test "should show gray div if env is not production and there is no renderer" do
    assert ::Rails.application.config.ads.renderer.nil?
    with_env 'development' do
      get '/'
      assert_response :success
      assert response.body.include?('<div style="width:728px;height:90px;background:#c8c8c8;"></div>')
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
