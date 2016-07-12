task :expired_event => :environment do
	@events = Event.where(expired: false)

	@events.each do |e|
		e.update_attribute(:expired, true) if e.deadline < DateTime.now
	end
end
