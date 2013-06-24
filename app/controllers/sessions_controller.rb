
class SessionsController < ApplicationController
  def new
  	@title = "Sign In"
  end
  def create
  	user = User.authenticate(params[:session][:email],
	params[:session][:password])
	if user.nil?
		flash.now[:error] = "Invalid email/password combination."
		@title = "Sign in"
		render 'new'
	else
		sign_in user
		redirect_back_or user
	end
  end
  def exam
    @users=User.all
    @user=current_user
  end
  def ques
    @email=params[:email]
    @admin=User.find_by_email(@email)
    if @admin.nil?
      flash[:error]="error occurred"
      redirect_to '/'
    end
    @questions=@admin.questions
  end
  def eval
    @score=0
    @alls=Score.find_by_user_id(current_user.id)
  end
  def add
    @admin=current_user
    @ques=Question.new
  end
  def addq
  end
  def destroy
  	sign_out
  	redirect_to root_path
  end
end
