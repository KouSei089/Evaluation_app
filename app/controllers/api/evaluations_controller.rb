class Api::EvaluationsController < ApplicationController
  def index
    @evaluations = Evaluation.order('created_at DESC')
  end
end
