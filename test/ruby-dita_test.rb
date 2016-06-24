# Copyright (c) 2016 Freescale Semiconductor Inc.

require_relative '../lib/ruby-dita'
require 'test/unit'

class Ruby_DitaTest < Test::Unit::TestCase
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

  def test_dita_option
    load(Doc.new)
    assert_equal GrammarClass, meta.grammar.class
    assert_equal 373, meta.grammar.nodes.size
    assert(doc << Element.new('topic'))
    t = doc.topic
    assert_equal 1, meta.history.nodes.size
    assert_raise(Exception, '') do t << Element.new('bogus') end
    assert_equal 3, meta.history.nodes.size
  end

  def test_create_map_file
  end

  def test_create_topic_file

  end

  def test_create_topicref

  end

  def test_invalid_root_attr

  end

  def test_valid_child

  end

  def test_invalid_child

  end

  def test_valid_attr

  end

  def test_invalid_attr

  end

  def test_valid_text

  end

  def test_invalid_text

  end

  def test_complex_dox

  end
end