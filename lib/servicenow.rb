#!/usr/bin/env ruby

#require_relative 'auth_creds.rb'
require 'json'
require 'faraday'

class Servicenow
  attr_accessor :request, :endpoint, :response
  SN_URL='https://duketest.service-now.com'
  SN_INCIDENT_URI='/api/now/v1/table/incident?sysparm_display_value=true'
  CALLER='aam79' # NetID of user submitting ticket

  # Test URL if you want to see if ServiceNow is available (get 1 incident number)
  # '/api/now/v1/table/incident?sysparm_limit=1&sysparm_fields=number'

  def initialize()
  end

  def sn_rest_client
    conn = Faraday.new(:url => SN_URL) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.response :raise_error
      faraday.adapter Faraday.default_adapter
    end
    conn.basic_auth('api.codeplus.oit','haAQYd+eNFsroU6nnUvq')
    conn.headers['Accept'] = 'application/json; version=2.0'
    conn.headers['Accept-Encoding'] = ''
    return conn
  end

  # all fields below are required
  def request_body
    request_body = {
    :active => 'true',
    :category => 'Other',
    :subcategory => 'Other',
    :u_service_provider => 'Duke University',
    :u_it_service => 'Public Computing Labs',
    :service_offering => 'Public Computing Labs Offering',
    :contact_type => 'email',
    :description => 'This is the lengthier description!',
    :impact => 'Individual',
    :urgency => 'Medium',
    :priority => 'Low',
    :incident_state => 'New',
    :notify => '1',
    :state => '1',
    :assignment_group => 'Service Desk-OIT',
    :short_description => 'This is the title of the the ticket!',
    :caller_id => CALLER
  }
  end

  def fetch
    response = sn_rest_client.post do |req|
      Rails::logger.debug "########## req" + req.inspect
      req.url SN_INCIDENT_URI
      req.options[:timeout] = 60
      req.options[:open_timeout] = 15
      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = 'application/json'
      req.body = self.request_body.to_json
    end
    j = JSON.parse(response.body, symbolize_names: true)
    puts j
  end

  def self.createTicket
    resp = Servicenow.new().fetch
  end
end