module Ads
  class Configuration

    def sample_tag(&block)
      if block_given?
        @sample_tag = block
      else
        @sample_tag
      end
    end

  end
end
