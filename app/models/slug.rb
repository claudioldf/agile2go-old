class Slug 	

	def initialize(model)
		@model = model
	end

	def generate
		@model.slug ||= @model.name.parameterize
	end

end