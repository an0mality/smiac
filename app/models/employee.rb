class Employee < ActiveRecord::Base
  validates :name, presence: true
  validates :surname, presence: true
  validates :patronymic, presence: true
  validates :phone_number, presence: true
  validates :department_id, presence: true
  belongs_to :department
  has_many :calendar_lists

  default_scope { order('boss DESC, surname ASC') }



  def fio
    self.surname + ' ' + self.name + ' ' + self.patronymic
  end

  def self.search params
    Employee.where('lower(surname) LIKE lower (?) or lower(phone_number) Like lower(?)', "%#{params[:search]}%", "%#{params[:search]}%")
  end

end
