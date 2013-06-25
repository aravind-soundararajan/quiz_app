
class QuestionsController < ApplicationController
  def new
  	@title="Add new question"
  	@ques = Question.new

  end

  def create
  	@ques = Question.new(:user_id => current_user.id,:content=>params[:content],:hint=>params[:hint],:option1=>params[:option1],:option2=>params[:option2],:option3=>params[:option3],:option4=>params[:option4],:answer=>params[:answer])
		if @ques.save
      		 flash[:success]="Question added"
			     if !user.admin?
              redirect_to exam_path
            else
              redirect_to editques_path
            end
      	else
			@title = "Add new question"
			render 'new'
		end
  end
  def edithelp
  	@user = current_user.name
		@title = "Modify Question"
    @questions = current_user.questions
  end
  def edit
      @ques=Question.find(params[:id])
  end
  def update
    @ques = Question.find(params[:id])
    if @ques.update_attributes(:user_id => current_user.id,:content=>params[:content],:hint=>params[:hint],:option1=>params[:option1],:option2=>params[:option2],:option3=>params[:option3],:option4=>params[:option4],:answer=>params[:answer])
      flash[:success] = "Question updated."
      if !current_user.admin?
        redirect_to exam_path
      else
        redirect_to editques_path
      end
    else
      @title = "Edit user"
      render 'edit'
    end
  end 
  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted."
    redirect_to editques_path
  end
end

