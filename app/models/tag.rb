class Tag < ActiveRecord::Base
	has_many :articles, through: :article_images
	has_many :article_images
	
	def self.feed
		tag = Tag.create(name: 'ФРМР/ФРМО')
			tag.article_images.create(name: 'frmr.png')

		tag = Tag.create(name: 'НРЭР')
			tag.article_images.create(name: 'nrer.png')
			
		tag = Tag.create(name: 'ФРДС')
			tag.article_images.create(name: 'frds.png')
		
		tag = Tag.create(name: 'Геопортал')
			tag.article_images.create(name: 'geo.png')

		tag = Tag.create(name: 'Медицинская статистика')
			tag.article_images.create(name: 'stat1.png')
			tag.article_images.create(name: 'stat2.png')

		tag = Tag.create(name: 'Независимая оценка качества')
			tag.article_images.create(name: 'nok.png')
			

		tag = Tag.create(name: 'Общее')
			tag.article_images.create(name: 'miac.png')
			tag.article_images.create(name: 'miac1.png')

		tag = Tag.create(name: 'РМИС')
			tag.article_images.create(name: 'rmis.png')

	end
end
