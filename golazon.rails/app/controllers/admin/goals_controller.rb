class Admin::GoalsController < ApplicationController
  def new
    @match = Match.find(params[:match_id])
    @goal = Goal.new
    @form = GoalForm.new(@goal)
    @form.prepopulate!
  end

  def create
    @match = Match.find(params[:match_id])
    @goal = Goal.new
    @form = GoalForm.new(@goal)

    if @form.validate(params[:goal])
      @form.sync
      @match.goals << @goal
      @match.save

      redirect_to matches_path, notice: "Goal added"
    else
      flash.now[:error] = "Could not save match. Fix errors."
      render "new"
    end
  end
end