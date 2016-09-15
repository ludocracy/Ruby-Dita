require_relative '../../lib/ruby-dita/table'
require 'test/unit'

class TableTest < Test::Unit::TestCase
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

  def test_row
    r = row(%w(asdf fdsa))
    assert_equal '<row><entry>asdf</entry><entry>fdsa</entry></row>', r.to_s
  end

  def test_colspec
    c = colspec({align: 'center', colname: '0'})
    assert_equal '<colspec align="center" colname="0"/>', c.to_s
  end

  def test_entry
    e = entry('content', {namest: 0, nameend: 3})
    assert_equal '<entry namest="0" nameend="3">content</entry>', e.to_s
  end

  def test_table
    x = table(%w(var0 var1), [["var0's value", "var1's value"]])
    answer = %(<table><tgroup cols="2"><thead><row><entry>var0</entry><entry>var1</entry></row></thead><tbody><row><entry>var0's value</entry><entry>var1's value</entry></row></tbody></tgroup></table>)
    assert_equal answer, x.to_s

    y = table(%w(a b), [row(%w(0 1)), row(%w(2 3))])
    answer = '<table><tgroup cols="2"><thead><row><entry>a</entry><entry>b</entry></row></thead><tbody><row><entry>0</entry><entry>1</entry></row><row><entry>2</entry><entry>3</entry></row></tbody></tgroup></table>'
    assert_equal answer, y.to_s
  end
end