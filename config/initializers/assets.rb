# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w(ckeditor/config.js)
Rails.application.config.assets.precompile += %w( rmi.js )
Rails.application.config.assets.precompile += %w( admin/rmi.js )
Rails.application.config.assets.precompile += %w( autocomplete-rails.js )
Rails.application.config.assets.precompile += %w( feedback.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( eco.js )
Rails.application.config.assets.precompile += %w( captcha.js )
Rails.application.config.assets.precompile += %w( organization.js )
Rails.application.config.assets.precompile += %w( nok.js )
Rails.application.config.assets.precompile += %w( admin/type_organization.js )
Rails.application.config.assets.precompile += %w( admin/document_stages.js )
Rails.application.config.assets.precompile += %w( admin/article.js )
Rails.application.config.assets.precompile += %w( admin/documents.js )
Rails.application.config.assets.precompile += %w( organization_equipment.js )

# Rails.application.config.assets.precompile += %w( lib/jquery-ui.min.js )
Rails.application.config.assets.precompile += %w( lib/moment.min.js )
Rails.application.config.assets.precompile += %w( fullcalendar/fullcalendar.js )
Rails.application.config.assets.precompile += %w( fullcalendar/locale/ru.js )
#Rails.application.config.assets.precompile += %w( fullcalendar.print.css )
Rails.application.config.assets.precompile += %w( fullcalendar.min.css )
Rails.application.config.assets.precompile += %w( calendar.js )
Rails.application.config.assets.precompile += %w( home.js )


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
