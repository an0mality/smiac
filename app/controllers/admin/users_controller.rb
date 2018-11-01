class Admin::UsersController < Admin::ApplicationController

  autocomplete :organization, :name, :full => true
  load_resource param_method: :params_user
  load_resource :class=> User
  authorize_resource

  def index
    @users = User.order('blocks ASC, moderator ASC, admin ASC, fio ASC')
  end

  def new

  end

  def edit
    @user= User.find(params[:id])
    if params[:user].present?
      respond_to do |format|
        if @user.update_attributes(params_user)
          format.html { redirect_to(@user, notice: "Обновлена учетная запись #{@user.username}") }
          format.json { respond_with_bip(@user) }
        else
          format.html { render action: "edit" }
          format.json { respond_with_bip(@user) }
        end
      end
    end
  end

  def create
    @user = User.create_user(params)
    if @user.save
      redirect_to admin_users_path, notice: "Вы добавили пользователя #{@user.username}"
    else
      render 'new', notice: 'Пользователь не может быть добавлен, возможно не заполнены поля'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params_user)
      redirect_to admin_users_path, notice: "Обновлена учетная запись #{@user.username}"
    else
      render "edit"
    end
  end

  def destroy

  end

  def reset_password
    @user = User.find(params[:id])
    if @user.update_attributes(password: "All2017miac", sign_in_count: 0)
      redirect_to admin_users_path, notice: "Вы сбросили пароль для пользователя #{@user.username}"
    else
      redirect_to admin_users_path, notice: "Вы не смогли сбросить пароль для пользователя #{@user.username}"
    end
  end

private

  def params_user
    params.require(:user).permit!
  end

end
