#!/usr/bin/env ruby

# require_relative 'auth_creds.rb'
# require 'faraday'
require 'json'

class Servicenow { 
    SN_URL='https://duketest.service-now.com'
    SN_INCIDENT_URI='/api/now/v1/table/incident?sysparm_display_value=true'

    # Test URL if you want to see if ServiceNow is available (get 1 incident number)
    # '/api/now/v1/table/incident?sysparm_limit=1&sysparm_fields=number'

    def sn_rest_client
        conn = Faraday.new(:url => SN_URL) do |faraday|
            faraday.request :url_encoded
            faraday.response :logger
            faraday.response :raise_error
            faraday.adapter Faraday.default_adapter
        end
        conn.basic_auth(APP_CREDS['sn_user'],APP_CREDS['sn_pass'])
        conn.headers['Accept'] = 'application/json; version=2.0'
        conn.headers['Accept-Encoding'] = ''
        return conn
    end

    # all fields below are required
    def setUpTicket(title:, description:, impact:, urgency:, netid:)
        request_body = {
            :active => 'true',
            :category => 'Other',
            :subcategory => 'Other',
            :u_service_provider => 'Duke University',
            :u_it_service => 'Public Computing Labs',
            :service_offering => 'Public Computing Labs Offering',
            :contact_type => 'email',
            :description => description,
            :impact => impact,
            :urgency => urgency,
            :priority => 'Low',
            :incident_state => 'New',
            :notify => '1',
            :state => '1',
            :assignment_group => 'Service Desk-OIT',
            :short_description => title,
            :caller_id => netid 
        }

        response = sn_rest_client.post do |req|
            req.url SN_INCIDENT_URI
            req.options.timeout = 60
            req.options.open_timeout = 15
            req.headers['Content-Type'] = 'application/json'
            req.headers['Accept'] = 'application/json'
            req.body = request_body.to_json
        end
        j = JSON.parse(response.body, symbolize_names: true)
        return j
    end
}
