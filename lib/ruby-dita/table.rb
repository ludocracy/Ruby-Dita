require 'duxml'

module Dita
  include Duxml
  # @param column_info [Array, Hash] if Array of Strings, column headings; if Array of Elements, colspecs; if Hash, keys are strings for column headings; values are <colspec> elements
  # @param rows [Array] array of rows with which to populate table; can either be XML <row> elements or Strings representing values
  # @return [Element] valid Dita <table>
  def table(column_info, rows=[])
    t = Element.new('table')
    headings = []
    case column_info
      when Array
        headings = column_info if column_info.first.is_a?(String)
        t << column_info if column_info.first.is_a?(Element)
      when Hash
        headings = column_info.keys
        t << column_info.values
      else
        # TODO raise error?
    end
    tgroup = Element.new('tgroup')
    if headings.any?
      tgroup << Element.new('thead', [Element.new('row')])
      headings.each do |h|
        tgroup.thead.row << Element.new('entry', [h])
      end
    end

    tgroup[:cols] = column_info.size.to_s
    tgroup << Element.new('tbody')
    tgroup.tbody << rows.collect do |r| row r end
    t << tgroup
  end

  # @param ary [Array] array of row entries or entry values
  # @return [Element] correctly formatted row
  def row(ary)
    return ary if ary.all? do |a| a.respond_to?(:name) and a.name == 'row' end
    Element.new('row') <<
        ary.collect do |entry|
          if entry.is_a?(Element) and entry.name == 'entry'
            entry
          else
            Element.new('entry') << entry
          end
        end
  end
end # end of module Table