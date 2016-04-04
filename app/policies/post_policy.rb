class PostPolicy
  attr_reader :current_user, :model
  
  def initialize(current_user, model)
    @current_user = current_user
    @post = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? || @current_user == User.find(@post.user_id)
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @current_user.admin? || @current_user == User.find(@post.user_id)
  end

  def edit?
    update?
  end

  def destroy?
    @current_user.admin? || @current_user == User.find(@post.user_id)
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
