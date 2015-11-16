require "bundler/setup"
require "jsondocr"
require "require_all"

# begin
#   require "pry"
#   require "pry-remote"
#   require "pry-nav"
# rescue LoadError
# end

module Golazon
end

Golazon::Schema = JSONdocr::Builders::Doc.new
Golazon::Schema.doc do
  name "Golazon Schema"
  desc "Flexible scalable denormalized non-relational football (soccer) data model on top of document-oriented database concepts."
end

require_all File.dirname(__FILE__) + "/golazon-schema"
