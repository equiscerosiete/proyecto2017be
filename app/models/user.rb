class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :donations,  foreign_key: "sender_id"

  before_save :set_saldo_zero
  
  def set_saldo_zero
    self.saldo ||= 0
  end
end
