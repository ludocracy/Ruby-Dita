# Copyright (c) 2016 Freescale Semiconductor Inc.

require 'duxml'


module Dita
  GRAMMAR_PATH = File.expand_path(File.dirname(__FILE__) + '/../xml/dita_grammar.xml')
  include Duxml

  # @param path_or_doc [String] path of Dita file or new Doc
  # @return [Doc] XML document
  def load(path_or_doc)
    super(path_or_doc, GRAMMAR_PATH)
  end
end