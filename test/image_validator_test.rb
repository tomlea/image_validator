require File.join(File.dirname(__FILE__), "test_helper")
require 'fileutils'

class ImageValidatorTest < Test::Unit::TestCase
  def test_an_invalid_image
    name = "dolphin.txt"
    assert_invalid(fixture(name))
    assert_invalid(fixture_filename(name))
    assert_invalid(fixture_as_string(name))
  end

  def test_a_missing_image
    name = "your_face"
    assert_invalid(StringIO.new("", "rb"))
    assert_invalid(name)
    assert_invalid("")
  end

  def test_a_png
    name = "space-lincoln.png"
    assert_valid(fixture(name))
    assert_valid(fixture_filename(name))
    assert_valid(fixture_as_string(name))
  end

  def test_a_gif
    name = "space-lincoln.gif"
    assert_valid(fixture(name))
    assert_valid(fixture_filename(name))
    assert_valid(fixture_as_string(name))
  end

  def test_a_jpeg
    name = "space-lincoln.jpg"
    assert_valid(fixture(name))
    assert_valid(fixture_filename(name))
    assert_valid(fixture_as_string(name))
  end
end

class ImageValidatorWithNoImageMagickTest < Test::Unit::TestCase
  def setup
    @fake_bin = File.expand_path(File.join(ENV["TMPDIR"], "ImageValidatorWithNoImageMagickTest_bin"))
    Dir.mkdir(@fake_bin)
    File.symlink(`which which`.chomp, File.join(@fake_bin, "which"))

    @orig_path = ENV["PATH"]
    ENV["PATH"] = @fake_bin
  end

  def test_should_explode_if_image_magick_is_missing
    e = assert_raise(RuntimeError){
      assert_valid(fixture("space-lincoln.png"))
    }
    assert_equal "identify command not found, please install imagemagick", e.message
  end

  def teardown
    FileUtils.rm_rf(@fake_bin)
    ENV["PATH"] = @orig_path
  end
end
