$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require "image_validator"
require "test/unit"

class Test::Unit::TestCase
  def fixture(name)
    File.open(fixture_filename(name), "rb")
  end

  def fixture_filename(name)
    File.join(File.dirname(__FILE__), "fixtures", name)
  end

  def fixture_as_string(name)
    fixture(name).read
  end

  def assert_valid(image)
    assert ImageValidator.valid?(image), "Expected image to be valid"
  end

  def assert_invalid(image)
    assert !ImageValidator.valid?(image), "Expected image to be invalid"
  end
end
