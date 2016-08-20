require 'duxml'

module Dita
  module Topic

    include Duxml

    # @param title [String, Element] string or XML rich-text
    # @param id [String] optional document-unique, XML-valid id string
    # @return [Element] valid Dita <topic>
    def topic(title, id=nil)
      t = Element.new('topic')
      t[:id] = id || "topic#{t.object_id.to_s}"
      t << Element.new('title', [title])
    end
  end
end