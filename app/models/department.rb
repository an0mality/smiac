class Department < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true


  has_many :employees, :dependent => :restrict_with_error

  default_scope { order('id ') }
  

  def self.search params
    Department.where('name LIKE lower (?) ', "%#{params[:search]}%")
  end

  def self.initial
    Department.create(name: 'Директор', cabinet_number: '1')
    Employee.create(name: 'xxx', surname: 'xxx', patronymic: 'xxxx', phone_number:'xxx (доб.11)', department_id: Department.last.id )

    Department.create(name: 'Административный отдел', cabinet_number: '10 и 11')
    Employee.create(name: 'xxx', surname: 'xxx', patronymic: 'xxx', phone_number:'xxx', department_id:  Department.last.id )
    Employee.create(name: 'xxx', surname: 'xxx', patronymic: 'xxx', phone_number:'xxx', department_id:  Department.last.id )


  end
end
