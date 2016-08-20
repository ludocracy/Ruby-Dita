# Copyright (c) 2016 Freescale Semiconductor Inc.

require_relative 'ruby-dita/topic'
require_relative 'ruby-dita/table'

module Dita
  include Topic
  include Table

  GRAMMAR_PATH = File.expand_path(File.dirname(__FILE__) + '/../xml/dita_grammar.xml')
  include Duxml

  # @param path [String] path of existing or new Dita file
  # @return [Doc] XML document
  def load(path)
    super(path, GRAMMAR_PATH)
  end

  # @return [GrammarClass] returns Dita grammar as standalone object
  def self.grammar
    Ox.parse_obj File.read GRAMMAR_PATH
  end
end