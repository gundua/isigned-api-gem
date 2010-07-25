module ISigned
  
  class Folder < Model
    attr_accessor :id, :parent_id, :name, :full_path
  
    def initialize(options)
      options.symbolize_keys!
    
      self.id = options[:id]
      self.parent_id = options[:parent_id]
      self.name = options[:name]
      self.full_path = options[:full_path]
    end

    def inspect
      "Folder: {:id => #{self.id}, :name => #{self.name}, :full_path => '#{self.full_path}}'"
    end
  
  end

end