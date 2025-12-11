require 'rails_helper'

RSpec.describe "Lições (Lessons)", type: :request do
  let!(:lesson) { Lesson.create(title: "Ruby Básico", description: "Intro") }
  let!(:question) { Question.create(body: "Quanto é 1+1?", lesson: lesson) }
  let!(:option) { Option.create(body: "2", correct: true, question: question) }

  describe "GET /lessons" do
    it "retorna a lista de lições com sucesso" do
      get "/lessons"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.size).to be >= 1
      expect(json[0]["title"]).to eq("Ruby Básico")
    end
  end

  describe "GET /lessons/:id" do
    it "retorna a lição completa com perguntas e opções" do
      get "/lessons/#{lesson.id}"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["title"]).to eq("Ruby Básico")
      expect(json["questions"].size).to eq(1)
      expect(json["questions"][0]["options"].size).to eq(1)
      expect(json["questions"][0]["options"][0]["body"]).to eq("2")
    end
  end
end
