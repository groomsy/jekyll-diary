class String
  def friendly_filenamize
    self.downcase.gsub(/[^\w\s_-]+/, '').gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2').gsub(/\s+/, '-')
  end
end