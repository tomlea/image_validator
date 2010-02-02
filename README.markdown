# ImageValidator

A simple image file validator using the identify command line app.

Checks to see if an image is valid.

## Uage

      ImageValidator.valid?(file)

`file` can be an IO, a filename or image data in a string. Returns true if the image exists.
 
 
      ImageValidator.valid?("missing_image.png") # => false
      ImageValidator.valid?("") # => false
      ImageValidator.valid?(File.open("an_image_file.png")) # => true
      # etc…
