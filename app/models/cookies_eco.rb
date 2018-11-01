class CookiesEco < ActiveRecord::Base

   validates :name, uniqueness: true
   validates :name, presence: true

   def  self.is_presented cookie
   	!CookiesEco.where(name: cookie).present?
   end
end
