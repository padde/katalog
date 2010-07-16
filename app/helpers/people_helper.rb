module PeopleHelper
  
  def for_unique_credits( person, opts = {}, &block )
    opts = { :join => ", " }.merge! opts
    
    person.things.uniq.each do |thing|
      credits = person.credits.where(:thing_id.eq % thing.id)
      roles = credits.map(&:role).to_sentence
      if block_given?
        yield thing, roles
      else
        return
      end
    end
  end
  
  def comma_separated_links_for (people)
    raw people.map{ |p| link_to p.full_name, p }.join(', ')
  end
  
end
