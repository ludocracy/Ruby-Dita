require 'duxml'

module Dita
  include Duxml

  # @param title [String, Element] string or XML rich-text
  # @param content [Array] optional topic body content in array form
  # @return [Element] valid Dita <topic>
  def self.topic(title, content=nil)
    t = Element.new('topic')
    t[:id] = "topic#{t.object_id.to_s}"
    t << Element.new('title', [title])
    t << Element.new('body', content) if content
  end
end