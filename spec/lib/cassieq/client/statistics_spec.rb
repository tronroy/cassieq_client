require "spec_helper"

RSpec.describe Cassieq::Client::Queues do
  let(:client) { Cassieq::Client.new(host: CONFIG["host"], account: CONFIG["account"], key: CONFIG["key"] )}
  let(:create_queue) { client.create_queue(queueName: "test_queue") }
  let(:publish_message) { client.publish_message("test_queue", "Here is message") }
  let(:delete_queue) { client.delete_queue("test_queue") }

  describe "#statistics" do
    let(:statistics) { client.statistics("test_queue") }

    it "returns statistical information" do
      create_queue
      publish_message
      expect(statistics).to eq(size: 1)
      delete_queue
    end
  end
end
