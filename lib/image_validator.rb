require 'stringio'

module ImageValidator
  def valid?(file)
    file = thing_to_io(file)
    check_image_magick_is_available
    IO.popen("identify - >/dev/null 2>&1", "w") do |identify|
      some_content_has_been_read = false
      while blk = file.read(1024**2)
        identify << blk
        some_content_has_been_read = true if blk != ""
      end
      return false unless some_content_has_been_read
    end
    $?.success?
  end

protected
  def check_image_magick_is_available
    raise "identify command not found, please install imagemagick" if `which identify` == ''
  end

  def thing_to_io(thing)
    return thing unless thing.is_a?(String)

    if (File.exists?(thing) rescue false)
      File.open(thing)
    else
      StringIO.new(thing, "rb")
    end
  end
  extend self
end
