class UserPolicy
  attr_reader :current_user, :model
  
  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin? || @current_user.lead?
  end

  def show?
    @current_user.admin? || @current_user.lead? || @current_user == @user
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    @current_user.admin? || @current_user.lead? || @current_user == @user
  end

  def edit?
    update?
  end

  def destroy?
    return false if @current_user == @user
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end