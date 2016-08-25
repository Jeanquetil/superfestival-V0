class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true # tout le monde peut créer un event
  end

  def destroy?
    is_user_owner_or_admin?
  end

  private

  def is_user_owner_or_admin?
    record.timetable.user == user || user.admin
  end
  # Ne pas oublier de faire le bon lien du record à l'user
end
