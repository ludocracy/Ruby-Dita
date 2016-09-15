require 'duxml'

module Dita
  include Duxml


  # @param ary [Array] array of row entries or entry values
  # @param attrs [Hash] optional attributes for row
  # @return [Element] correctly formatted row
  def row(ary, attrs={})
    return ary if ary.all? do |a| a.respond_to?(:name) and a.name == 'row' end
    Element.new('row', attrs) <<
        ary.collect do |e|
          if e.is_a?(Element) and e.name == 'entry'
            e
          else
            entry e
          end
        end
  end

  # @param column_info [Array, Hash] if Array of Strings, column headings; if Array of Elements, colspecs; if Hash, keys are strings for column headings; values are <colspec> elements
  # @param rows [Array] array of rows with which to populate table; can either be XML <row> elements or Strings representing values
  # @param attrs [Hash] attributes of table
  # @return [Element] valid Dita <table>
  def table(column_info, rows, attrs={})
    t = Element.new('table', attrs)
    headings = []
    tgroup = Element.new('tgroup')
    num_cols = column_info.size.to_s
    case column_info
      when Array
        headings = column_info if column_info.first.is_a?(String)
        colspecs = column_info if column_info.first.is_a?(Element) and column_info.first.name == 'colspec'
      when Hash
        headings = column_info.keys
        colspecs = column_info.values
      else
        # TODO raise error?
    end
    if colspecs
      colspecs.each_with_index do |c, index| c[:colname] = index.to_s end
      tgroup << colspecs
    end
    if headings.any?
      tgroup << Element.new('thead', [Element.new('row')])
      headings.each do |h|
        tgroup.thead.nodes.first << Element.new('entry', [h])
      end
    end

    tgroup[:cols] = num_cols
    tgroup << Element.new('tbody')
    tgroup.tbody << rows.collect do |r| row r end
    t << tgroup
  end

  # @param attrs [Hash] attributes of a given column
  # @return [Element] colspec element
  def colspec(attrs)
    Element.new('colspec', attrs)
  end

  # @param content [String, Element] content of entry
  # @param attrs [Hash] attributes of entry
  # @return [Element] entry element
  def entry(content, attrs={})
    Element.new('entry', attrs, [content])
  end
end # end of module Table

