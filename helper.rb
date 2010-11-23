
class Array
  def split_nest(min, max)
    raise ArgunmentError 'split(min, max)  min should be less than max' if min > max
    result = Array.new
    _self = self.clone
    _self
    loop do
      tmp = Array.new
      size = rand(max-min+1)+min
      size.times do
        break if _self.size < 1
        tmp << _self.shift
      end
      result << tmp
      break if _self.size < 1
    end
    return result
  end
end

