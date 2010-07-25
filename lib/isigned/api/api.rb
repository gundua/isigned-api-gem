module ISigned #:nodoc:
  module API #:nodoc:
    
    def self.api_host_address
      "http://staging.isigned.com"
    end
    
    def self.request(options)
      response = HTTParty.get(api_host(options), :query => options[:parameters])

      if options.has_key?(:save_as)
        File.open(options[:save_as], 'w') do |file|
          file << response
        end
      else
        API::Response.new(:response => response)
      end
    end
    
    def self.upload_files(options)
      response = HTTParty.post(api_host(options),
                               :query => options[:parameters],
                               :headers => {'Content-Type' => 'multipart/form-data, boundary=iSigned_file_upload_boundary'},
                               :body => request_body_for_file_upload(:files => options[:files]))

      API::Response.new(:response => response)
    end
    
    def self.api_host(options)
      "#{self.api_host_address}/api/#{options[:url]}"
    end

    def self.request_body_for_file_upload(options)
      files = options[:files]
      post_body = []

      files.each_with_index do |file, index|
        file_name = File.basename(file)

        post_body << "--iSigned_file_upload_boundary"
        post_body << "Content-Disposition: form-data; name=\"file_#{index + 1}\"; filename=\"#{file_name}\""
        post_body << 'Content-Type: application/octet-stream'
        post_body << ''
        post_body << File.read(file)
      end

      post_body << "--iSigned_file_upload_boundary--"

      post_body.join("\r\n")
    end

  end
  
end
