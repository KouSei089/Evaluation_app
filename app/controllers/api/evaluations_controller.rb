class Api::EvaluationsController < ApplicationController
  def index
    @evaluations = Evaluation.order('created_at DESC')
  end
  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      render :show, status: :created
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  private
    def evaluation_params
      params.permit(:title, :services, :language, :description)
    end
end
