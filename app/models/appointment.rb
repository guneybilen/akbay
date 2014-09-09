class Appointment < ActiveRecord::Base

  include Humanizer
  require_human_on :create

  validates :firstname, presence: true
  validates :email, presence: true,
                    :length => { :within => 5..50 },
                    :format => { :with => /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i }
  validates :phone, presence: true


end
