module ThingsHelper
  
  def for_unique_people( thing, opts = {}, &block )
    opts = { :join => ", " }.merge! opts
    
    thing.people.uniq.each do |person|
      credits = person.credits.where(:thing_id.eq % thing.id)
      roles = credits.map(&:role).to_sentence
      
      if block_given?
        yield person, roles
      else
        return
      end
    end
  end
  
end
