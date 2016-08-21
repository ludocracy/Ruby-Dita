# Copyright (c) 2016 Freescale Semiconductor Inc.

require_relative 'ruby-dita/topic'
require_relative 'ruby-dita/table'

module Dita
  GRAMMAR_PATH = File.expand_path(File.dirname(__FILE__) + '/../xml/dita_grammar.xml')
  include Duxml

  # @param path [String] path of existing or new Dita file
  # @return [Doc] XML document
  def load(path)
    super(path, GRAMMAR_PATH)
  end

  # @param path [String] where to save output file
  # @param output [Doc] document to save; if output.grammar is same as Dita.grammar, adds Dita doctype declaration
  # @return [Doc] same as @param output
  def save(path, output=doc)
    if output.grammar.rules.size == Dita.grammar.rules.size # TODO find better way to compare these!!
      File.write(path, %(<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">#{output.root.to_s}))
    else
      super(path, output)
    end
    output
  end

  # @return [GrammarClass] returns Dita grammar as standalone object
  def self.grammar
    Ox.parse_obj File.read GRAMMAR_PATH
  end
end