class BookingPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    record.user == user
  end

  def show?
    true
  end

  def create?
    true
  end
end
