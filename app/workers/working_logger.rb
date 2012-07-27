class WorkingLogger
  @queue = 'logger_queue'
  def self.perform
    p '*' * 100
    p 'Logging!' 
  end
end