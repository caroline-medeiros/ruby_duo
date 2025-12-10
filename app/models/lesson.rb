class Lesson < ApplicationRecord
  #uma lição tem muitas perguntas
  #dependent: :destroy garante que se deletar a lição, as perguntas somem (limpeza)
  has_many :questions, dependent: :destroy
end
