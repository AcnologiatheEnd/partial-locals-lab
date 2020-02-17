# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  
  #the code below somewhat works like the one below it but it is now obsolete
  
  #def self.search(name)
   # if name == ''
  #    self.all
   # else
   #   self.all.select {|student| student.name.downcase.include?(name.downcase)}
   # end
  #end
  
  def self.search(query)
    if query.present?
      where('NAME like ?', "%#{query}%")
    else
      self.all
    end
  end
end
