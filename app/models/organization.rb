# coding: utf-8
class Organization < ActiveRecord::Base

  has_many :feedback
  has_many :nok_rating
  belongs_to :type_organization

  def self.search params
    result = Organization
    result = result.find(params[:id]) if params[:id].present?
    result = result.where('lower(name) like lower(?) or lower(full_name) like lower(?)', "%#{params[:search]}%", "%#{params[:search]}%").order(:name) if params[:search].present?
    result
  end


end
