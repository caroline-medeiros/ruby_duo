# db/seeds.rb

puts "🌱 Limpando banco de dados..."
Option.destroy_all
Question.destroy_all
Lesson.destroy_all

puts "📚 Criando Lição 1: Fundamentos..."

l1 = Lesson.create!(
  title: "Ruby Básico",
  description: "Sintaxe, variáveis e métodos simples."
)

# Pergunta 1
q1 = l1.questions.create!(body: "Como imprimimos algo na tela em Ruby com quebra de linha?")
q1.options.create!(body: "print 'Ola'", correct: false)
q1.options.create!(body: "puts 'Ola'", correct: true)
q1.options.create!(body: "echo 'Ola'", correct: false)
q1.options.create!(body: "fmt.Println('Ola')", correct: false)

# Pergunta 2
q2 = l1.questions.create!(body: "Qual é a convenção de nome para variáveis locais?")
q2.options.create!(body: "snake_case (ex: nome_completo)", correct: true)
q2.options.create!(body: "camelCase (ex: nomeCompleto)", correct: false)
q2.options.create!(body: "PascalCase (ex: NomeCompleto)", correct: false)

# Pergunta 3
q3 = l1.questions.create!(body: "O que é um Symbol em Ruby (ex: :nome)?")
q3.options.create!(body: "Uma string mutável", correct: false)
q3.options.create!(body: "Um identificador imutável e leve", correct: true)
q3.options.create!(body: "Um tipo de número", correct: false)

# Pergunta 4
q4 = l1.questions.create!(body: "Qual método transforma '10' (string) em 10 (inteiro)?")
q4.options.create!(body: ".to_i", correct: true)
q4.options.create!(body: ".to_int", correct: false)
q4.options.create!(body: ".parse_int", correct: false)

# Pergunta 5
q5 = l1.questions.create!(body: "Como se inicia um comentário em Ruby?")
q5.options.create!(body: "// Comentário", correct: false)
q5.options.create!(body: ".", correct: false)
q5.options.create!(body: "# Comentário", correct: true)


puts "💎 Criando Lição 2: Orientação a Objetos..."

l2 = Lesson.create!(
  title: "Ruby OOP",
  description: "Classes, Objetos e Herança."
)

# Pergunta 1
q2_1 = l2.questions.create!(body: "Qual palavra-chave define uma classe?")
q2_1.options.create!(body: "struct", correct: false)
q2_1.options.create!(body: "class", correct: true)
q2_1.options.create!(body: "object", correct: false)

# Pergunta 2
q2_2 = l2.questions.create!(body: "Qual é o método construtor de uma classe?")
q2_2.options.create!(body: "constructor", correct: false)
q2_2.options.create!(body: "initialize", correct: true)
q2_2.options.create!(body: "new", correct: false)

# Pergunta 3
q2_3 = l2.questions.create!(body: "Como indicar herança (Ex: Cachorro herda de Animal)?")
q2_3.options.create!(body: "class Cachorro < Animal", correct: true)
q2_3.options.create!(body: "class Cachorro extends Animal", correct: false)
q2_3.options.create!(body: "class Cachorro : Animal", correct: false)

# Pergunta 4
q2_4 = l2.questions.create!(body: "O que significa 'self' em Ruby?")
q2_4.options.create!(body: "Refere-se à classe pai", correct: false)
q2_4.options.create!(body: "Refere-se ao objeto atual", correct: true)
q2_4.options.create!(body: "É uma variável global", correct: false)

# Pergunta 5
q2_5 = l2.questions.create!(body: "Variáveis de instância começam com qual símbolo?")
q2_5.options.create!(body: "$ (ex: $nome)", correct: false)
q2_5.options.create!(body: "@ (ex: @nome)", correct: true)
q2_5.options.create!(body: "@@ (ex: @@nome)", correct: false)

puts "✅ Banco recheado com sucesso! Agora vai! 🚀"
