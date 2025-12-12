class AiTutorService
  GEMINI_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent"

  def self.explain_error(question_body, wrong_answer, correct_answer)
    api_key = ENV["GEMINI_API_KEY"]
    return "Erro: Chave não configurada." if api_key.nil?

    prompt = <<~TEXT
      Atue como um professor de Ruby simpático.
      O aluno errou esta pergunta: "#{question_body}"
      Ele escolheu: "#{wrong_answer}"
      A correta era: "#{correct_answer}"
      Explique o erro em 2 frases e dê uma dica curta.
    TEXT

    uri = URI("#{GEMINI_URL}?key=#{api_key}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"
    request.body = { contents: [ { parts: [ { text: prompt } ] } ] }.to_json

    begin
      response = http.request(request)
      data = JSON.parse(response.body)

      data.dig("candidates", 0, "content", "parts", 0, "text") || "A IA ficou sem palavras."
    rescue => e
      "Erro ao contatar o professor IA."
    end
  end
end
