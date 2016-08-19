class Borrower < ActiveRecord::Base
  has_secure_password
  has_many :lenders
  has_many :histories
  has_many :lenders_history, through: :histories, source: :lender


  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :purpose, :description, :presence => true
  validates :email, uniqueness: { case_sensitive: false } , :format => { :with => email_regex }
  validates :password, :length => {:within => 6..40}, on: [:create]

end
