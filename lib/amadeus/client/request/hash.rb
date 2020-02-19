# frozen_string_literal: true

module Amadeus
  class Request
    # Helper methods to for the {Amadeus::Request} object to help it
    # flatten hash keys
    # @!visibility private
    module Hash
      private

      # Flattens the hash keys, so page: { offset: 1 } becomes
      # 'page[offset] => 1'
      def flatten_keys(value, key = nil, out_hash = {})
        case value
        when nil then return ''
        when ::Hash
          value.each { |k, v| flatten_keys(v, append_key(key, k), out_hash) }
        when Array
          value.each { |v| flatten_keys(v, :"#{key}[]", out_hash) }
        else
          out_hash[key] = value
        end
        out_hash
      end

      # Used by .flatten_keys to add a sub key to a key
      def append_key(root_key, key)
        root_key.nil? ? :"#{key}" : :"#{root_key}[#{key}]"
      end
    end
  end
end
