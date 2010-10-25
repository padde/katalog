class StudyModule < ActiveRecord::Base
  has_and_belongs_to_many :things
  belongs_to :department
  has_many :teachers, :class_name => 'Person'
  
  KINDS = %w{ Entwurf Fachkurs Fachmodul Kolloquium Kurs Projekt Projektmodul Seminar Tutorium Übung Vorlesung Workshop Sonstige }
  
  scope :asc, order('name')
end