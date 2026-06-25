# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todos, dependent: :destroy

  ROLES = %i[admin user].freeze

  def roles=(roles)
    roles = [*roles].map(&:to_sym)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      roles_mask.to_i.nobits?(2**ROLES.index(r))
    end
  end

  def role?(role)
    roles.include?(role)
  end
end
