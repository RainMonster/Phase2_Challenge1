class Task < ActiveRecord::Base
  after_initialize :init

  def init
    self.complete ||= "false"
  end
  
end
