require_relative '../../lib/ruby-dita/topic'
require 'test/unit'

class TopicTest < Test::Unit::TestCase
  include Dita
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
    x = topic('ruby-dita', %w(some <p>content</p>))
    assert_match /<topic id="topic[0-9]{8}"\/>/, x.sclone.to_s
    assert_equal '<title>ruby-dita</title>', x.title.to_s
    assert_equal '<body>some<p>content</p></body>', x.body.to_s
  end
end