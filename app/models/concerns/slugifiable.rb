module Slugifiable
    module FindBySlug

        def find_by_slug(slug)
            reverse_slug = slug.split("-").map {|word| word.capitalize}.join(" ")
            self.all.where("name = ?", reverse_slug).first
        end
    end

    module Slug
        def slug
            slug_name = self.name
            slug_name.downcase.gsub(" " , "-")
        end
    end
end