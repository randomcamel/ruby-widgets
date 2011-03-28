# Copyright Chris Doherty 2011
# chris@randomcamel.net

# Array bounds checking in Ruby. Forces you to use push(), unshift(), or
# << for array construction, or pass a size to new(). Basically it
# disables auto-growing arrays. Monkeypatching this in general would of
# course break everything in the world, but it'd be fun to be able to add
# it to existing Arrays.


class IndexError < StandardError
end

class SafeArray < Array

  alias array_access []
  alias array_assign []=

  def [](i)
    begin
       if self.size > 0 && i > self.size - 1
        raise IndexError.new("Array index '#{i}' is out of bounds.")
      end
    end
    return super(i)
  end

  def []=(i, obj)
    if self.size > 0 && i > self.size - 1
      raise IndexError.new("Array index '#{i}' is out of bounds (use push or unshift).")
    end
    return super(i, obj)
  end
end

