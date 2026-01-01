require "net/http"
require "json"
require "uri"

class AiTutorService
  GEMINI_API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent"

  def initialize(error_message, code_snippet)
    @error_message = error_message
    @code_snippet = code_snippet
    @api_key = ENV["GEMINI_API_KEY"]
  end

  def call
    return "Erro: Chave de API não configurada" unless @api_key

    response = send_request
    parse_response(response)
  end

  private

  def send_request
    uri = URI("#{GEMINI_API_URL}?key=#{@api_key}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"
    request.body = build_body.to_json

    http.request(request)
  end


  def build_body
    {
      contents: [ {
        parts: [ {
          text: "Atue como tutor de Ruby. O aluno cometeu este erro: #{@error_message} neste código: #{@code_snippet}. Explique o erro de forma breve."
        } ]
      } ]
    }
  end

  def parse_response(response)
    if response.code == "200"
      json = JSON.parse(response.body)
      json.dig("candidates", 0, "content", "parts", 0, "text") || "Não consegui gerar uma explicação."
    else
      "Erro na comunicação com a IA: #{response.code}"
    end
  end
end
