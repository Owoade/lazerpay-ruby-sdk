require "httparty"
require_relative "api_module.rb"
class Agent 

    def self.post endpoint, payload

        sk = payload[:secret_key];
        pk = payload[:public_key];
        data = payload[:data];

        response = HTTParty.post("#{API::BASE_URL}#{endpoint}",
			:body => data.to_json,
			:headers => { "Authorization"=> "Bearer #{sk}", "X-api-key" => pk,  "content-type" => "application/json"})
		return response

    end

    def self.get endpoint, payload 

        sk = payload[:secret_key];
        pk = payload[:public_key];
        rp = payload[:route_parameter];
        qp = payload[:query_parameter];

        url = rp.nil? ? "#{API::BASE_URL}#{endpoint}" : "#{API::BASE_URL}#{endpoint}/#{rp}"

        url = qp.nil? ? "#{API::BASE_URL}#{endpoint}" : "#{API::BASE_URL}#{endpoint}?#{qp}" if rp.nil?

        puts url

        response = HTTParty.get(url,
			  :headers => { "Authorization"=> "Bearer #{sk}", "X-api-key" => pk,  "content-type" => "application/json"})
		return response
    end
end