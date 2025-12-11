puts "🌱 Limpando banco de dados..."
Option.destroy_all
Question.destroy_all
Lesson.destroy_all

# ==============================================================================
# LIÇÃO 1: FUNDAMENTOS
# ==============================================================================
puts "📚 Criando Lição 1: Fundamentos (8 Perguntas)..."

l1 = Lesson.create!(
  title: "Ruby Básico",
  description: "Sintaxe, variáveis, strings e métodos simples."
)

# Q1
q1 = l1.questions.create!(body: "Como imprimimos algo na tela em Ruby com quebra de linha?")
q1.options.create!(body: "print 'Ola'", correct: false)
q1.options.create!(body: "puts 'Ola'", correct: true)
q1.options.create!(body: "echo 'Ola'", correct: false)
q1.options.create!(body: "fmt.Println('Ola')", correct: false)

# Q2
q2 = l1.questions.create!(body: "Qual é a convenção de nome para variáveis locais?")
q2.options.create!(body: "snake_case (ex: nome_completo)", correct: true)
q2.options.create!(body: "camelCase (ex: nomeCompleto)", correct: false)
q2.options.create!(body: "PascalCase (ex: NomeCompleto)", correct: false)

# Q3
q3 = l1.questions.create!(body: "O que é um Symbol em Ruby (ex: :nome)?")
q3.options.create!(body: "Uma string mutável", correct: false)
q3.options.create!(body: "Um identificador imutável e leve", correct: true)
q3.options.create!(body: "Um tipo de número", correct: false)

# Q4
q4 = l1.questions.create!(body: "Qual método transforma '10' (string) em 10 (inteiro)?")
q4.options.create!(body: ".to_i", correct: true)
q4.options.create!(body: ".to_int", correct: false)
q4.options.create!(body: ".parse_int", correct: false)

# Q5
q5 = l1.questions.create!(body: "Como se inicia um comentário em Ruby?")
q5.options.create!(body: "// Comentário", correct: false)
q5.options.create!(body: "\\ Comentário", correct: false)
q5.options.create!(body: "# Comentário", correct: true)

# Q6
q6 = l1.questions.create!(body: "Como fazemos interpolação de string (colocar variável dentro do texto)?")
q6.options.create!(body: "'Olá $name'", correct: false)
q6.options.create!(body: "\"Olá \#{name}\"", correct: true)
q6.options.create!(body: "\"Olá {name}\"", correct: false)

# Q7 (Nova)
q7 = l1.questions.create!(body: "Qual método usamos para saber o tamanho de uma String ou Array?")
q7.options.create!(body: ".count()", correct: false)
q7.options.create!(body: ".size ou .length", correct: true)
q7.options.create!(body: ".sizeof", correct: false)

# Q8 (Nova)
q8 = l1.questions.create!(body: "Qual é o valor que representa 'nulo' ou 'vazio' em Ruby?")
q8.options.create!(body: "null", correct: false)
q8.options.create!(body: "undefined", correct: false)
q8.options.create!(body: "nil", correct: true)


# ==============================================================================
# LIÇÃO 2: ORIENTAÇÃO A OBJETOS
# ==============================================================================
puts "💎 Criando Lição 2: Orientação a Objetos (8 Perguntas)..."

l2 = Lesson.create!(
  title: "Ruby OOP",
  description: "Classes, Objetos, Herança e Encapsulamento."
)

# Q1
q2_1 = l2.questions.create!(body: "Qual palavra-chave define uma classe?")
q2_1.options.create!(body: "struct", correct: false)
q2_1.options.create!(body: "class", correct: true)
q2_1.options.create!(body: "object", correct: false)

# Q2
q2_2 = l2.questions.create!(body: "Qual é o método construtor de uma classe?")
q2_2.options.create!(body: "constructor", correct: false)
q2_2.options.create!(body: "initialize", correct: true)
q2_2.options.create!(body: "new", correct: false)

# Q3
q2_3 = l2.questions.create!(body: "Como indicar herança (Ex: Cachorro herda de Animal)?")
q2_3.options.create!(body: "class Cachorro < Animal", correct: true)
q2_3.options.create!(body: "class Cachorro extends Animal", correct: false)
q2_3.options.create!(body: "class Cachorro : Animal", correct: false)

# Q4
q2_4 = l2.questions.create!(body: "O que significa 'self' em Ruby?")
q2_4.options.create!(body: "Refere-se à classe pai", correct: false)
q2_4.options.create!(body: "Refere-se ao objeto atual", correct: true)
q2_4.options.create!(body: "É uma variável global", correct: false)

# Q5
q2_5 = l2.questions.create!(body: "Variáveis de instância (do objeto) começam com qual símbolo?")
q2_5.options.create!(body: "$ (ex: $nome)", correct: false)
q2_5.options.create!(body: "@ (ex: @nome)", correct: true)
q2_5.options.create!(body: "@@ (ex: @@nome)", correct: false)

# Q6
q2_6 = l2.questions.create!(body: "Como criar getters e setters automaticamente?")
q2_6.options.create!(body: "get_set :nome", correct: false)
q2_6.options.create!(body: "attr_accessor :nome", correct: true)
q2_6.options.create!(body: "property :nome", correct: false)

# Q7
q2_7 = l2.questions.create!(body: "Como instanciamos (criamos) um novo objeto da classe User?")
q2_7.options.create!(body: "User.new", correct: true)
q2_7.options.create!(body: "new User()", correct: false)
q2_7.options.create!(body: "User.create_instance", correct: false)

# Q8
q2_8 = l2.questions.create!(body: "Variáveis de CLASSE (compartilhadas por todos objetos) começam com:")
q2_8.options.create!(body: "@", correct: false)
q2_8.options.create!(body: "@@", correct: true)
q2_8.options.create!(body: "$", correct: false)


# ==============================================================================
# LIÇÃO 3: AVANÇADO (NOVO)
# ==============================================================================
puts "🚀 Criando Lição 3: Avançado & Funcional (5 Perguntas)..."

l3 = Lesson.create!(
  title: "Ruby Avançado",
  description: "Blocos, Iteradores, Módulos e Mixins."
)

# Q1
q3_1 = l3.questions.create!(body: "Qual a diferença principal entre .map e .each?")
q3_1.options.create!(body: "Nenhuma, são iguais.", correct: false)
q3_1.options.create!(body: ".map retorna um novo array transformado, .each retorna o original.", correct: true)
q3_1.options.create!(body: ".each é mais rápido.", correct: false)

# Q2
q3_2 = l3.questions.create!(body: "O que são 'Gems' em Ruby?")
q3_2.options.create!(body: "Moedas do jogo.", correct: false)
q3_2.options.create!(body: "Bibliotecas ou pacotes de código reutilizável.", correct: true)
q3_2.options.create!(body: "Erros de compilação.", correct: false)

# Q3
q3_3 = l3.questions.create!(body: "Qual palavra-chave usamos para criar um Módulo?")
q3_3.options.create!(body: "group", correct: false)
q3_3.options.create!(body: "package", correct: false)
q3_3.options.create!(body: "module", correct: true)

# Q4
q3_4 = l3.questions.create!(body: "O que acontece se usarmos 'include' de um módulo numa classe?")
q3_4.options.create!(body: "Os métodos do módulo viram métodos de instância da classe.", correct: true)
q3_4.options.create!(body: "Os métodos do módulo viram métodos estáticos.", correct: false)
q3_4.options.create!(body: "Nada acontece.", correct: false)

# Q5
q3_5 = l3.questions.create!(body: "Como definimos um bloco de código simples?")
q3_5.options.create!(body: "Entre chaves {} ou do...end", correct: true)
q3_5.options.create!(body: "Entre colchetes []", correct: false)
q3_5.options.create!(body: "Entre parênteses ()", correct: false)


puts "✅ Banco recheado com sucesso! (Total: 3 Lições, 21 Perguntas). Agora vai! 🚀"
