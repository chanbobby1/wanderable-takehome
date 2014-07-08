class Person
  attr_accessor :uuid, :first_name, :last_name

  def initialize(first_name, last_name)
    @uuid ||= SecureRandom.uuid
    @first_name = first_name
    @last_name = last_name
  end

  def as_json(options = {})
    super(options).merge({:full_name => full_name})
  end

  def full_name
    return "#{first_name} #{last_name}"
  end
end
