class UsersController < Clearance::UsersController

  skip_before_action :redirect_signed_in_users
  before_action :must_be_superadmin, only: [:create, :new]

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params

    if @user.save
      flash[:notice] = "Nouvel utilisateur créé avec succès : #{@user.email}"
      redirect_to root_path
    else
      flash[:notice] = "Erreur lors de la création du nouvel utilisateur"
      render template: "users/new"
    end
  end

  private

  def must_be_superadmin
    if current_user.try(:role) != 'superadmin'
      flash[:notice] = "URL non autorisée"
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

end
