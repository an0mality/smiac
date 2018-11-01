require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.department_id = 16
    subject.surname = "Anything"
    subject.name = "sok"
    subject.patronymic = "pop"
    subject.phone_number = "1"
    expect(subject).to be_valid
  end

  it "is fio method" do
    subject.surname = "Иванов"
    subject.name = "Иван"
    subject.patronymic = "Сидорович"
    expect(subject.fio).to eq("Иванов Иван Сидорович")
  end


end
