# Copyright (c) 2016 Freescale Semiconductor Inc.

require_relative '../lib/ruby-dita/table'
require 'duxml'


module Dita
  GRAMMAR_PATH = File.expand_path(File.dirname(__FILE__) + '/../xml/dita_grammar.xml')
  include Duxml

  # @param path [String] path of Dita file. if does not exist, will create
  # @return [Doc] XML document
  def load(path, opts={})
    @doc = Doc.new.write_to path unless File.exists?(path)
    super(path, GRAMMAR_PATH)
  end
end