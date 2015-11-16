module TextifiedArray
  extend ActiveSupport::Concern

  SCORE_TEXT_FORMAT = /^\d{1,2}-\d{1,2}$/

  module ClassMethods
    def textified_array(name, opts)
      separator = opts[:separator] || ", "

      define_method("#{name}_text=") do |text|
        self.send("#{name}=", text.split(separator).collect(&:strip)) unless text.blank?
      end

      define_method("#{name}_text") do
        values = self.send(name)
        return "" if values.blank?
        values.join(separator)
      end
    end
  end
end
