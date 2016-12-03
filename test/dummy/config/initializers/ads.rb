Ads.configure do |config|

  config.sample_tag do |options|
    styles = {
      width: "#{options[:width]}px",
      height: "#{options[:height]}px",
      background: '#c8c8c8'
    }
    content_tag(
      :div,
      nil,
      style: styles.map{ |k,v| "#{k}: #{v};" }.join(' ')
    )
  end

end
