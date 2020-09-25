# frozen_string_literal: true

class QuickfixFormatter
  RSpec::Core::Formatters.register self, :example_failed

  def initialize(output)
    @output = output
  end

  def example_failed(notification)
    @output << my_format(notification) + "\n"
  end

  private

  def my_format(notification)
    rtn = format(
      '%s: %s',
      notification.example.location,
      notification.exception.message
    )

    rtn.gsub("\n", ' ')[0, 160]
  end
end

RSpec.configure do |c|
  c.silence_filter_announcements = true
end
