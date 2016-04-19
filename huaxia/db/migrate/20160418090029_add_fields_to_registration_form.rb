class AddFieldsToRegistrationForm < ActiveRecord::Migration
  def change
    add_column :registration_files, :birthday_place, :string
    add_column :registration_files, :birthday, :date
    add_column :registration_files, :passport_number, :string
    add_column :registration_files, :passport_exipred_date, :date
    add_column :registration_files, :university_1, :string
    add_column :registration_files, :university_2, :string
    add_column :registration_files, :other_university, :string
    add_column :registration_files, :program, :string
    add_column :registration_files, :major, :string
    add_column :registration_files, :hsk_level, :string
    add_column :registration_files, :toefl_score, :string
    add_column :registration_files, :fc_legalisir_ijazah, :string
    add_column :registration_files, :fc_legalisir_translate_ijazah, :string
    add_column :registration_files, :fc_legalisir_raport_transkip, :string
    add_column :registration_files, :fc_legalisir__translate_raport_transkip, :string
    add_column :registration_files, :passport, :string
    add_column :registration_files, :pas_foto, :string
    add_column :registration_files, :medical_check_up, :string
    add_column :registration_files, :study_plan, :string
    add_column :registration_files, :surat_rekomendasi, :string
    add_column :registration_files, :hsk, :string
    add_column :registration_files, :proposal_disertasi, :string
    add_column :registration_files, :beasiswa, :string
  end
end
