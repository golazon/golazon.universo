require "sass"

module Sass::Script::Functions
  def image_path(filename)
    assert_type filename, :String
    Sass::Script::String.new(AssetHelper::image_path(filename.value))
  end
end