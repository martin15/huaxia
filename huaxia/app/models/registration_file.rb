class RegistrationFile < ActiveRecord::Base
  attr_accessible :sender_name, :email, :permalink, :attachment

  has_attached_file :attachment

  validates_attachment_size :attachment, :less_than => 1.megabytes, :message => "File Yang di upload maximal 1 Mb"
  validates_attachment_presence :attachment, :message => "Anda harus mengupload file form registrasi"
  validates_attachment_content_type :attachment,
      :content_type => ["application/msword",
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document"],
      :message => "File yang di upload harus microsoft word"

  validates :sender_name, :presence => {:message => "anda tidak boleh kosong"}
  validates :email, :presence => {:message => "anda tidak boleh kosong"},
                    :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                                 :message => "format salah"}
end
