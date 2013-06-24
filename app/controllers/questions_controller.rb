
class QuestionsController < ApplicationController
  def new
  	@title="Add new question"
  	@ques = Question.new

  end

  def create
  	@ques = Question.new(:user_id => current_user.id,:content=>params[:content],:hint=>params[:hint],:option1=>params[:option1],:option2=>params[:option2],:option3=>params[:option3],:option4=>params[:option4],:answer=>params[:answer])
		if @ques.save
      		 flash[:success]="Question added"
			 redirect_to current_user
      	else
			@title = "Add new question"
			render 'new'
		end
  end
   def edit
      if params[:quesid].empty?
      flash[:error]="Invalid Question ID" 
      redirect_to '/editques'
    end
   		@user = current_user.name
      @ques = Question.find(params[:quesid])
		@title = "Edit Question"
  end
  def update
		@ques = Question.find(params[:id])
		if @ques.update_attributes(:user_id => current_user.id,:content=>params[:content],:hint=>params[:hint],:option1=>params[:option1],:option2=>params[:option2],:option3=>params[:option3],:option4=>params[:option4],:answer=>params[:answer])
			flash[:success] = "Question updated."
			redirect_to current_user
		else
			@title = "Edit user"
			render 'edit'
		end
  end	
  def edithelp
  	@user = current_user.name
		@title = "Edit Question"

  end
  def deletehelp
    @user=current_user.name
    @title="Delete Question"
  end
  def delete
    if params[:quesid].empty?
      flash[:success] = "Invalid ID"
      redirect_to '/delques'
    end
    if Question.destroy(params[:quesid])
      flash[:success] = "Question updated."
      redirect_to current_user
    else
      flash[:success] = "Question doesn't exist."
    end 
  end
end

