$: << 'lib'

require 'lib/isigned'

user, authenticated = ISigned::User.authenticate(:email => 'bob_smith@mailinator.com', :password => 'password')

p user
p authenticated

#travel_folder = user.find_folder(:path => 'Personal/Travel')

#document = ISigned::Document.build(:name => 'one')

#document = user.documents.first

#updated = user.update_document(:document => document, 
#                               :attributes => {:name => '',
#                                               :description => 'Updated description 3333333333333', 
#                                               :expires_on => '2010/01/03'})

#p updated
#p document.errors

#p user.documents.first




#document = user.find_document(:id => 1)

#p document

#uploaded_documents = user.upload_documents(:to => travel_folder,
#                                           :files => ['/Users/guilio/Desktop/natural farming.pdf', 
#                                                      '/Users/guilio/Desktop/one straw revolution.pdf'])



#shared_with = user.share_document(:document => ISigned::Document.new(:id => 27), :with => 'jane@mailinator.com, foo@mailinator.com')

#p shared_with

#file = user.download_document(:document => uploaded_documents.second, :save_as => '/Users/guilio/Desktop/a_copy.pdf')

#p file

#puts "Uploaded #{uploaded_documents.size} Documents:"

#uploaded_documents.each do |uploaded_document|
#  puts "  #{uploaded_document.inspect}"
#end

#if !uploaded_documents.empty?
#  shared_with = user.share_document(:document => uploaded_documents.first, :with => 'jane@mailinator.com, foo@mailinator.com')

#  puts "Shared Document with:"
#  p shared_with
#end

#p user.download_document(:document => uploaded_documents.first, :save_as => 'boo_hoo.rb')



