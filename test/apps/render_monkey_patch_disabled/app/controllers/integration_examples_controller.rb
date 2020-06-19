# frozen_string_literal: true
module Dummy2
  class IntegrationExamplesController < ActionController::Base
    layout false

    def variants
      request.variant = params[:variant].to_sym if params[:variant]
    end

    def controller_inline
      render(ControllerInlineComponent.new(message: "bar"))
    end

    def controller_inline_baseline
      render("integration_examples/_controller_inline", locals: { message: "bar" })
    end

    def controller_to_string
      render(plain: render_to_string(ControllerInlineComponent.new(message: "bar")))
    end

    def products
      @products = [OpenStruct.new(name: "Radio clock"), OpenStruct.new(name: "Mints")]
    end
  end
end
