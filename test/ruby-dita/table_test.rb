require_relative '../../lib/ruby-dita/table'
require 'test/unit'
include Dita

class TableTest < Test::Unit::TestCase
  include Table
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

  def test_colspec

  end

  def test_table
    x = table(%w(var0 var1), [["var0's value", "var1's value"]])
    answer = %(<table><tgroup cols="2"><thead><row><entry>var0</entry><entry>var1</entry></row></thead><tbody><row><entry>var0's value</entry><entry>var1's value</entry></row></tbody></tgroup></table>)
    assert_equal answer, x.to_s
  end
end