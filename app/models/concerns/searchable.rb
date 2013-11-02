module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def search(param)
      return ordered unless param
      tokens = param.split(/\s+/)
      conditions = tokens.collect do |token|
        self::COLUMNS.collect do |column|
          if token =~ /^\d+$/
            "#{column} = #{token}"
          else
            "#{column} like '%#{token}%'"
          end
        end
      end
      conditions = conditions.flatten.join(" or ")
      where(conditions)
    end
  end

end
