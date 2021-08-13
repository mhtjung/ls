class SecretFile
  
  def initialize(secret_data)
    @data = secret_data
    @log = SecurityLogger.new
  end

  def data
    @data
    @log.create_log_entry
  end
end