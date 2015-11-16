def doc
  Cholo.build
end
memoize :schema

def formatter
  JSONdocr::Formatter.new
end
memoize :formatter

def html_image(src, alt = "")
  size = Dimensions.dimensions(File.expand_path("output/#{src}"));
  "<img src=\"#{src}\" width=\"#{size[0]}\" height=\"#{size[1]}\" alt=\"#{alt}\"/>"
end

include AssetHelper
include ItemHelper
