class Appointment < ActiveRecord::Base

  attr_accessor :bypass_humanizer

  include Humanizer
  require_human_on :create, :unless => :bypass_humanizer

  validates :firstname, presence: true
  validates :email, presence: true,
                    :length => { :within => 5..50 },
                    :format => { :with => /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i }
  validates :phone, presence: true


end
