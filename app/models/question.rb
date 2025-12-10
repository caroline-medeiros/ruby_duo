class Question < ApplicationRecord
  belongs_to :lesson
  #uma pergunta tem muitas opções
  has_many :options, dependent: :destroy

  #validação simples: não pode salvar pergunta sem texto
  validates :body, presence: true
end
