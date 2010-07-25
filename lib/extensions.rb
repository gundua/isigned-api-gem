class Object #:nodoc:
  
  def not_nil?
    !self.nil?
  end
  
  def not_blank?
    !self.blank?
  end

  def true?
    self == true
  end

  def false?
    self == false
  end

end