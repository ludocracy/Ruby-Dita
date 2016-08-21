require_relative '../../lib/ruby-dita/topic'
require 'test/unit'

class TopicTest < Test::Unit::TestCase
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_topic
    x = Dita.topic('ruby-dita', 'asdf')
    assert_equal '<topic id="asdf"><title>ruby-dita</title></topic>', x.to_s
  end
end