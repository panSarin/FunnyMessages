class UserForm < FormObject
  attr_accessor :name, :dialect

  validate do
    errors[:name] = 'can\'t be blank' if name.empty?
  end

  validate do
    errors[:dialect] = 'can\'t be blank' if dialect.empty?
  end

end
