class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

def dashboard?
  return true
end

  def create?
    return true
  end

  def show?
    return true
  end



end

