module Concerns::Findable
    def find_by_name(name)
       self.all.find {|object|object.name==name}
       
    end
    def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    
    end
    def sorted
        self.all.uniq.sort_by{|object|object.name}

    end
end