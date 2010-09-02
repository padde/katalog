module PeopleHelper
  
  def for_unique_credits( person, &block )
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
end
