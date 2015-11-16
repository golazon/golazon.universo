class Admin::MatchesController < ApplicationController
  def new
    @match = Match.new
    @form = MatchForm.new(@match)
    @form.prepopulate!
  end

  def create
    @match = Match.new
    @form = MatchForm.new(@match)

    if @form.validate(params[:match])
      @form.sync
      @match.save

      redirect_to matches_path, notice: "Match added (#{@match.date}: #{@match.teams[0].name} - #{@match.teams[1].name})"
    else
      flash.now[:error] = "Could not save match. Fix errors."
      render "new"
    end
  end

  def edit
    @match = Match.find(params[:id])
    @form = MatchForm.new(@match)
  end

  def update
    @match = Match.find(params[:id])
    @form = MatchForm.new(@match)

    if @form.validate(params[:match])
      @form.sync
      @match.save

      redirect_to matches_path, notice: "Match saved (#{@match.date}: #{@match.teams[0].name} - #{@match.teams[1].name})"
    else
      flash.now[:error] = "Could not save match. Fix errors."
      render "edit"
    end
  end
end