module ISigned
   
  class User < Model
    attr_accessor :email, :token

    def initialize(options) #:nodoc:
      self.email = options[:email]
      self.token = options[:token]
    end
    
    # Authenticates a User, requires a User to be signed up and activated at http://www.isigned.com
    # 
    # ==== Options:
    #
    # * +email+ - The email address of the User to authenticate.
    # * +password+ - Optional. Works in conjunction with the +url+ option and indicates if latitude and longitude parameters of
    def self.authenticate(options)
      response = ISigned::API.request(:url => 'user/authenticate', 
                                      :parameters => {:email => options[:email], :password => options[:password]})

      if response.has_message?('Incorrect email or password')
        return nil, false
      else
        return User.new(:email => options[:email], :token => response['authentication']['token']), true  
      end
    end
    
    # Lists the Users Documents.
    def documents
      response = ISigned::API.request(:url => 'user/documents', :parameters => {:api_token => self.token}) 

      documents_response = response['documents']

      if documents_response.not_nil?
        documents_response['document'].collect do |document_attributes|
          Document.build document_attributes
        end
      else
        []
      end
    end

    # Finds a Document by either +id+ or +name+.
    #
    # ==== Options:
    #
    # * +id+ - If id is supplied, the Document will be found by its id.
    # * +name+ - If a name is supplied, the Document will be found by its name.
    def find_document(options)
      id = options[:id]
      name = options[:name]
      
      self.documents.find do |document|
        if id.not_nil?
          document.id == id
        elsif name.not_nil?
          document.name == name
        end
      end
    end
     
    # Downloads a Document file, common types of files include .pdf, .jpg, .xls and .doc. 
    #
    # ==== Options:
    #
    # * +document+ - The Document to download.
    # * +to+ - The directory path where the file will be saved to.
    def download_document(options)
      document = options[:document]
      save_to = options[:to]

      ISigned::API.request(:url => 'user/download_document', 
                           :parameters => {:id => document.id, :api_token => self.token}, 
                           :save_as => "#{save_to}/#{document.file_name}")
    end
  
    # Lists the Users Folders.
    def folders
      response = API.request(:url => 'user/folders', :parameters => {:api_token => self.token}) 

      response['folders']['folder'].collect do |folder_attributes|
        Folder.build folder_attributes
      end
    end  
    
    # Finds a Folder by its +path+.
    #
    # ==== Options:
    #
    # * +path+ - The full path of the Folder
    def find_folder(options)
      path = options[:path]
    
      self.folders.find do |folder|
        folder.full_path == path
      end
    end  
    
    # Shares a Document with a list of email addresses.
    #
    # ==== Options:
    #
    # * +document+ - The Document to share
    # * +with+ - A comma list of email addresses to share the Document with.
    def share_document(options)
      document = options[:document]
      with = options[:with]

      sharing_response = ISigned::API.request(:url => 'user/share_document',
                                              :parameters => {:document_id => document.id, :with => with,
                                                              :api_token => self.token})

      shared_with_response = sharing_response['document_share']['shared_with']
      
      if shared_with_response.not_nil?
        shared_with_response['user']
      else
        sharing_response['document_share']['addtional_information']['message']
      end
    end
    
    # Uploads files to be stored as Documents on iSigned.
    #
    # ==== Options:
    #
    # * +to+ - The Folder to upload to.
    # * +files+ - An array of paths of local files to upload.
    def upload_documents(options)
      upload_response = ISigned::API.upload_files(:url => 'user/upload_documents',
                                                  :parameters => {:folder_id => options[:to].id, :api_token => self.token},
                                                  :files => options[:files])

      messages = upload_response['document_upload']['messages']

      if messages != nil && messages['message'] == 'Free trial document limit reached'
        puts "Free trial document limit reached"
      end

      uploaded_documents = if upload_response['document_upload']['documents'] != nil
                             upload_response['document_upload']['documents']['document'].collect do |document_attributes|
                               Document.new(document_attributes)
                             end
                           else
                              []
                           end

      uploaded_documents
    end
    
    # Updates a Document.
    #
    # ==== Options:
    #
    # * +document+ - The Document to update
    # * +attributes+ - The attributes of the Document to update.
    #   * +name+ - The updated name of the Document
    #   * +description+ - The updated description of the Document
    #   * +expires_on+ - The updated expires_on date of the Document
    def update_document(options)
      document = options[:document]
      attributes = options[:attributes]      
      api_parameters = ({:id => document.id, :api_token => self.token}).merge(attributes)

      update_response = ISigned::API.request(:url => 'user/update_document', :parameters => api_parameters)

      updated = update_response.has_message?('Document updated')

      if updated.true?
        attributes.each do |name, value|
          document.send "#{name}=", value
        end
      else
        document.errors = update_response.errors
      end

      updated
    end
    
  end

end