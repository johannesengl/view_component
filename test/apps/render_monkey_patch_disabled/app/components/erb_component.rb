# frozen_string_literal: true
module Dummy2
  class ErbComponent < ViewComponent::Base
    def initialize(message:)
      @message = message
    end
  end
end
