class SalesforceObjectFieldsController < ApplicationController

  def index
    sf_client = Restforce.new
    sf_fields = sf_client.describe("#{params[:salesforce_object_id]}__c")["fields"].select{|f| f["updateable"]}.collect{|f| {name: f["name"], odk_fields: []}}
    render json: sf_fields
  end

end