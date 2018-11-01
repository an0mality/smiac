class Vacancy < ActiveRecord::Base
  scope :actual, -> {where(actual: true)}
end
