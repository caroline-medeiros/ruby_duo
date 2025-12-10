class LessonsController < ApplicationController
  # GET /lessons
  def index
    @lessons = Lesson.all
    render json: @lessons
  end

  # GET /lessons/1
  def show
    @lesson = Lesson.find(params[:id])

    # O PULO DO GATO AQUI:
    # Estamos dizendo: "Rails, me traga a lição, mas INCLUA as perguntas,
    # e dentro das perguntas, INCLUA as opções".
    render json: @lesson.to_json(
      include: {
        questions: {
          include: :options
        }
      }
    )
  end
end