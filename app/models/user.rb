# coding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :roles
  belongs_to :role

  has_many :documents
  has_many :articles


  def self.create_user params
    User.create(email: params.require(:user)[:email], username: params.require(:user)[:username], password:"All2017miac", fio: params.require(:user)[:fio],organization: params.require(:user)[:organization], sign_in_count:0)
  end

end
