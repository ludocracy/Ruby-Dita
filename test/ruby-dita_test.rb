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

  def test_dita_option
    load('test.dita')
    assert_equal GrammarClass, doc.grammar.class
    assert_equal 373, doc.grammar.rules.size
    assert(doc << Element.new('topic'))
    t = doc.topic
    assert_equal 1, doc.history.events.size
    assert_raise(Exception, '') do t << Element.new('bogus') end
    assert_equal 3, doc.history.events.size
    doc.history.strict?(false)
    doc.topic << Element.new('bogus')
    assert_equal %(: <bogus> added to <topic> at index 0. violates Children Rule that <topic>'s children must match '((title,titlealts?,(shortdesc|abstract)?,prolog?,body?,related-links?,topic*))'.),
                 doc.history.events.first.description[72..-1]
    doc.topic[:id] = 'asdf asdf'
    assert_equal %(: <topic> given new attribute 'id' with value 'asdf asdf'. violates Value Rule that @id's value must match 'ID'.),
        doc.history.events.first.description[72..-1]
  end

  def test_save
    load 'test.dita'
    save 'test.dita', doc
    dita = File.read 'test.dita'
    assert_equal %(<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">), dita

    save 'test.xml', Doc.new
    xml = File.read 'test.xml'
    assert_equal %(<?xml  version="1.0"?>\n), xml
  end

  def teardown
    FileUtils.rm_f(%w(test.dita test.xml .test.dita.duxml .test.xml.duxml))
  end
end