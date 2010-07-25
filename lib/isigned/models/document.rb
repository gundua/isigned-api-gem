module ISigned

  class Document < Model 
    attr_accessor :id, :name, :description, :expires_on, :filename_with_extension

    def initialize(options)
      options.symbolize_keys!

      self.id = options[:id]
      self.name = options[:name]
      self.description = options[:description]
      self.expires_on = options[:expires_on]
      self.filename_with_extension = options[:filename_with_extension]
    end

    def inspect
      "Document: {:id => #{self.id}, :name => #{self.name}, :description => #{self.description}, :expires_on => #{self.expires_on}}, :filename_with_extension => #{self.filename_with_extension}"
    end

  end

end