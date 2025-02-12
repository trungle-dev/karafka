# frozen_string_literal: true

module Karafka
  module Connection
    # Builder used to construct Kafka client
    module Builder
      class << self
        # Builds a Kafka::Client instance that we use to work with Kafka cluster
        # @param consumer_group [Karafka::Routing::ConsumerGroup] consumer group for which we want
        #   to have a new Kafka client
        # @return [::Kafka::Client] returns a Kafka client
        def call(consumer_group)
          adapter = ApiAdapter.client(consumer_group)
          Kafka.new(
            adapter[0],
            **adapter[1]
          )
        end
      end
    end
  end
end
