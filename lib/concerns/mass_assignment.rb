module MassAssignment
  module ClassMethods
  end

  module InstanceMethods
    def initialize(attributes)
      attributes.each {|key, value| self.send(("#{key}="), value)}
    end
  end
end
