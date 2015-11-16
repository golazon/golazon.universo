module AssetHelper
  def stylesheet_path(filename)
    fingerprintize "/assets/styles/#{filename}"
  end

  def image_path(filename)
    fingerprintize "/assets/images/#{filename}"
  end

  private
    def fingerprintize(path)
      "#{path}?#{fingerprint}"
    end

    def fingerprint
      Time.now.gmtime.to_s.gsub(/\D/, "")
    end
    memoize :fingerprint
end