require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

class WriterTest < Test::Unit::TestCase
  def setup
  end

  def test_unsupported_format
    unsupported = :gibberish
    assert_raise { Writer.create(unsupported) }
  end

  def test_yaml_format
    writer = nil
    assert_nothing_raised { writer = Writer.create(:yaml) }
    assert.equal writer.file_for("sometable"), "sometable.yml"

    input = {:key => "value"}
    expectation = input.to_yaml
    assert.equal writer.write_object(input), expectation
  end

  def test_json_format
    writer = nil
    assert_nothing_raised { writer = Writer.create(:json) }
    assert.equal writer.file_for("sometable"), "sometable.json"

    input = {:key => "value"}
    expectation = input.to_json
    assert.equal writer.write_object(input), expectation
  end
end
