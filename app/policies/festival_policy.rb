class FestivalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def display_timetable?
    true
  end

end
