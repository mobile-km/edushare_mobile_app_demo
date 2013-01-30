class DemoModel
  def initialize(options = {})
    options.each do |k, v|
      self.instance_variable_set "@#{k}", v
    end
  end

  def self.find(id)
    self.all[id - 1]
  end

  def self.all
    @all ||= self.make_all
  end
end
