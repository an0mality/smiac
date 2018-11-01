class Subscribe < ActiveRecord::Base
	
	validates :mail, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :mail, uniqueness: true
	before_create :confirmation_token
  validates_presence_of :consent_to_the_processing_of_personal_data, message: 'Поле обязательно к заполнению'

	validate :documents_or_articles
  scope :confirmed, -> { where(email_confirmed: true) }

  scope :art, -> { confirmed.where(articles: true) }
  scope :doc, -> { confirmed.where(documents: true) }
  scope :calendar, -> { confirmed.where(calendar: true) }


private
    
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

    def documents_or_articles
    	unless articles || documents || calendar
    		errors.add(:documents, 'Выберите на какие обновления вы подписываетесь')
    		errors.add(:articles, 'Выберите на какие обновления вы подписываетесь')
        errors.add(:calendar, 'Выберите на какие обновления вы подписываетесь')
    	end
    end

    
end
