class AiController < ApplicationController
  def explain
    question = params[:question]
    wrong = params[:wrong]
    correct = params[:correct]

    explanation = AiTutorService.explain_error(question, wrong, correct)

    render json: { explanation: explanation }
  end
end
