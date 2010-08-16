class Event < ActiveRecord::Base
	belongs_to :supporter
	def self.get_events
		where("startDate >= '2010-08-01 00:00:00' AND endDate <= '2010-09-12 00:00:00'")
	end
	
	def self.soon_on_call
    where({:startDate => Date.yesterday..Date.today.end_of_week} | {:endDate =>Date.yesterday..Date.today.end_of_week})
  end

end
