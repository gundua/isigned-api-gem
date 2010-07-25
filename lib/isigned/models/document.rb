module ISigned

  class Document < Model 
    attr_accessor :id, :name, :description, :expires_on

    def initialize(options)
      options.symbolize_keys!

      self.id = options[:id]
      self.name = options[:name]
      self.description = options[:description]
      self.expires_on = options[:expires_on]
    end

    def inspect
      "Document: {:id => #{self.id}, :name => #{self.name}, :description => #{self.description}, :expires_on => #{self.expires_on}}"
    end

  end

end