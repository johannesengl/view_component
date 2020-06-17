# frozen_string_literal: true

class MyComponentPreview < ViewComponent::Preview
  layout "admin"

  def default
    render(MyComponent.new)
  end
end
