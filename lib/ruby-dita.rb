# Copyright (c) 2016 Freescale Semiconductor Inc.

require 'duxml'


module Dita
  GRAMMAR_PATH = File.expand_path(File.dirname(__FILE__) + '/../xml/dita_grammar.xml')
  include Duxml

  # @param path [String] path of existing or new Dita file
  # @return [Doc] XML document
  def load(path)
    super(path, GRAMMAR_PATH)
  end
end