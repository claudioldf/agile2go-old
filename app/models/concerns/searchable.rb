module Searchable
  extend ActiveSupport::Concern
  module ClassMethods
    def search(param)
      return ordered unless param
      tokens = param.split(/\s+/)
      conditions = tokens.collect do |token|
        self::COLUMNS.collect do |column|
          "#{column} like '%#{token}%'"
        end
      end
      conditions = conditions.flatten.join(" or ")
      where(conditions)
    end
  end
end
