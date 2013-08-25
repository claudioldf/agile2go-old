# class DateValidator < ActiveModel::EachValidator
#   DATE_REGEX = /^\d{4}-\d{2}-\d{2}/

#   def validate_each(record, attribute, value)
#     unless value.match EMAIL_REGEX
#       record.errors.add(attribute, "#{value} is not a valid email")
#     end
#   end
# end
