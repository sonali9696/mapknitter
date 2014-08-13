# config/initializers/sprockets.rb
module Sprockets
	def self.env
		@env ||= begin
			sprockets = Sprockets::Environment.new
			sprockets.append_path 'app/assets/javascripts'
			sprockets.append_path 'app/assets/stylesheets'
			sprockets
		end
	end

	def self.manifest
		@manifest ||= Sprockets::Manifest.new(env, Rails.root.join('public', 'assets', 'manifest.json'));
	end
end

Rails.configuration.action_view.debug_sprockets = true unless Rails.env.production?