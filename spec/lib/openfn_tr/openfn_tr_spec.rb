require 'spec_helper'
require 'openfn_tr/openfn_tr'

describe OpenFn::Tr do

  describe ".encode" do

    let(:raw_source_payload) {
      "event=incoming_message&from_number=%2B16505550123&content=Hello+world"
    }

    subject { OpenFn::Odk.encode(raw_source_payload) }

    it "returns a generic data structure for OpenFn" do
      pending("TODO")
      expect(subject).to eql "{\"event\":[\"incoming_message\"],\"from_number\":[\"+16505550123\"],\"content\":[\"Hello world\"]}"
    end
  end

#TODO: the rest of the spec!

  describe ".decode" do

  end

  describe ".verify" do
    before :each do
      @odk_connection = double
      @credential = OdkCredential.new(details: { username: 'ABC', password: '123', url: 'http://example.net' }, verified: nil)
      expect(OdkAggregate::Connection).to receive(:new).and_return(@odk_connection)
    end

    it 'verifies the credential object and returns true if valid' do
      pending("TODO")
      expect(@odk_connection).to receive(:all_forms).and_return(true)
      expect(described_class.verify(@credential)).to eq true
    end

    it 'verifies the credential object and returns false if invalid' do
      pending("TODO")
      expect(@odk_connection).to receive(:all_forms).and_raise("Nope")
      expect(described_class.verify(@credential)).to eq false
    end
  end
end