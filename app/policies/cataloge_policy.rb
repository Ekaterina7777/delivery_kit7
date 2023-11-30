class CatalogePolicy < ApplicationPolicy
    def create?
      user.manager?
    end

    def update?
        user.manager?
    end

    def destroy?
      user.manager?
    end

    def index?
      user.manager?
    end
  
    def show?
      user.manager?
    end
end