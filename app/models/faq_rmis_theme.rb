class FaqRmisTheme < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :faq_rmis_answers
end
