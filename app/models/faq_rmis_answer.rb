class FaqRmisAnswer < ActiveRecord::Base
  validates :faq_rmis_theme_id, presence: true
  validates :description, presence: true
  belongs_to :faq_rmis_theme


  def self.search params
    FaqRmisAnswer.where('lower(question) LIKE lower (?)', "%#{params[:search]}%")
  end
end
