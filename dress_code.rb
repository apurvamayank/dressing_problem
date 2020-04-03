class DressCode

  def initialize(input="")
    @input = input.split(' ').map(&:to_i)
    @dress =  { 
                1 => 'hat',
                2 => 'pants',
                3 => 'shirt',
                4 => 'shoes',
                5 => 'socks',
                6 => 'leave'
              }
  end

  def dressed
    given_sequence = []
    as_per_rule = []
    dressed = []
    dressed = ['fail'] if @input.empty? # incase no input is given
    @input.each do |i|
      given_sequence << i
      as_per_rule = send("#{@dress[i]}_rule")
      if (as_per_rule - given_sequence).empty?
        dressed << @dress[i]
      else
        dressed << 'fail'
        break
      end
    end

    return dressed.join(',')
  end

  private

  def shoes_rule
    #shoe should come before pant and socks
    [2, 5]
  end

  def pants_rule
    # no prior rule before you wear pant
    [2]
  end

  def socks_rule
    # no prior rule before you wear sock
    [5]
  end

  def hat_rule
    # all dress items should come before hat. 
    # Note: hat is optional
    [2, 3, 4, 5]
  end

  def shirt_rule
    [3]
  end

  def leave_rule
    #only leave when all items are there
    [2, 3, 4, 5]
  end

end
