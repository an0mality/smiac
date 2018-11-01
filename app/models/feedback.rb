class Feedback < ActiveRecord::Base

  belongs_to :organization
  belongs_to :theme

  validates :fio,presence: true, format:{:with => /[-а-яё._ ]{3,}/}
  validates :tel, presence: true, format:{:with => /[0-9\-()+]{6,17}/}
  validates :email,presence: true, format:{:with => /@/}
  validates :theme_id, presence: true
  validates :message, presence: true, length: { minimum: 10 }
  validates :org_text, presence: true

  def verify_google_recptcha(secret_key,response)
    status = `curl “https://www.google.com/recaptcha/api/siteverify? secret=#{secret_key}&response=#{response}”`
    hash = JSON.parse(status)
    hash[“success”] == true ? true : false
  end

end