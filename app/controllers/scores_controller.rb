class ScoresController < ApplicationController
  before_filter :authenticate, :only => [:create]

  def create
    @score = current_user.scores.build(params[:score])
    if (@score.save)
      head :ok
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  def index
    unless signed_in?
      respond_to do |format|
        format.json { render json: [], root: false }
      end
      return
    end

    @scores = current_user.scores

    respond_to do |format|
      format.json { render json: @scores, root: false }
    end
  end
end
