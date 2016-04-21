class RegistrationFile < ActiveRecord::Base
  attr_accessible :sender_name, :email, :permalink, :attachment, :birthday_place,
                  :birthday, :passport_number, :passport_exipred_date, :university_1,
                  :university_2, :other_university, :program, :major, :hsk_level,
                  :toefl_score, :fc_legalisir_ijazah, :fc_legalisir_translate_ijazah,
                  :fc_legalisir_raport_transkip, :fc_legalisir__translate_raport_transkip,
                  :passport, :pas_foto, :medical_check_up, :study_plan, :surat_rekomendasi,
                  :hsk, :proposal_disertasi, :beasiswa, :major_2, :toefl, :hskk, :hskk_level

  has_attached_file :attachment

  belongs_to :univ_1, :class_name => "University", :foreign_key => :university_1
  belongs_to :univ_2, :class_name => "University", :foreign_key => :university_2
#  validates_attachment_size :attachment, :less_than => 1.megabytes, :message => "File Yang di upload maximal 1 Mb"
#  validates_attachment_presence :attachment, :message => "Anda harus mengupload file form registrasi"
#  validates_attachment_content_type :attachment,
#      :content_type => ["application/msword",
#             "application/vnd.openxmlformats-officedocument.wordprocessingml.document"],
#      :message => "File yang di upload harus microsoft word"

  validates :sender_name, :presence => {:message => "anda tidak boleh kosong"}
  validates :email, :presence => {:message => "anda tidak boleh kosong"},
                    :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                                 :message => "format salah"}
  #validates :birthday_place, :presence => {:message => "anda tidak boleh kosong"}
  validates :birthday, :presence => {:message => "anda tidak boleh kosong"}
  validates :passport_number, :presence => {:message => "anda tidak boleh kosong"}
  validates :passport_exipred_date, :presence => {:message => "anda tidak boleh kosong"}
  validates :program, :presence => {:message => "anda tidak boleh kosong"}
  validates :major, :presence => {:message => "anda tidak boleh kosong"}
  validates :major_2, :presence => {:message => "anda tidak boleh kosong"}
  #validates :hsk_level, :presence => {:message => "anda tidak boleh kosong"}
  validates :toefl_score, :presence => {:message => "anda tidak boleh kosong"}

end



