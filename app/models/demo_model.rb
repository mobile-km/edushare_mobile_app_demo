class DemoModel
  def initialize(options = {})
    options.each do |k, v|
      self.send "#{k}=", v
    end
  end

  def self.find(id)
    self.all[id.to_i - 1]
  end

  def self.all
    @all ||= self.make_all
  end

  def id
    self.class.all.index(self) + 1
  end
end
