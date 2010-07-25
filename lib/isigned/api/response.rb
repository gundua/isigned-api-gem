module ISigned #:nodoc:
  module API #:nodoc:
    
    class Response #:nodoc:
      attr_accessor :response

      def initialize(options)
        self.response = options[:response]
      end
  
      def has_message?(message)
        self.response['message'] == message
      end

      def errors
        [self.response['errors']['error']].flatten
      end

      def [](key)
        self.response[key]
      end
    end

  end
end