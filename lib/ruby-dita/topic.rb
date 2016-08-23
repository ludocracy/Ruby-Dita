require 'duxml'

module Dita
  include Duxml

  # @param title [String, Element] string or XML rich-text
  # @param content [Array] optional topic content in array form; added as direct children of <topic>, not <body>
  # @return [Element] valid Dita <topic>
  def topic(title, content=nil)
    t = Element.new('topic')
    t[:id] = "topic#{t.object_id.to_s}"
    t << Element.new('title', [title])
    t << content if content
    t
  end
end