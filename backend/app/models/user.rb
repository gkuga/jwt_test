class User < ApplicationRecord
  has_secure_token
  has_many :cars

  def self.find_for_jwt_authentication(id)
    User.find(id)
  end

  def jwt_subject
    id
  end

  def jwt_payload
    { 'foo' => 'bar' }
  end
end
