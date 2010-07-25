module ISigned
  
  class Model
    attr_accessor :errors

    def self.build(options)
      model = self.new(options)

      model.errors = []

      model
    end

  end

end