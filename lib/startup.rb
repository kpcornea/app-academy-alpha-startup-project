require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    return true if @salaries.include?(title)
    false
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise "An error has occurred"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    if @salaries[employee.title] > @funding
      raise "An error has occurred"
    else
      employee.pay(@salaries[employee.title])
      @funding -= @salaries[employee.title]
    end
  end

  def payday
    @employees.each do |employee|
      pay_employee(employee)
    end
  end

end
