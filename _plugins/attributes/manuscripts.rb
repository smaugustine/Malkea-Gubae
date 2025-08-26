Jekyll::Hooks.register :site, :pre_render do |site|

  site.data["items"] = []

  site.collections["manuscripts"].docs.each do |manuscript|

    manuscript.data["title"] = "MS #{manuscript.data["short"]}"

    unless manuscript.data.include? "century"
      manuscript.data["century"] = manuscript.data["origin"]
    end

    manuscript.data["units"].each_with_index do |unit, u|

      unit["contents"] = unit["contents"].each{ |item| item["uid"] = "CAe#{item["clavis"]}" }

      site.data["items"].concat unit["contents"].map.with_index{ |item, i|
        {
          "uid" => item["uid"],
          "locus" => item["locus"],
          "position" => "unit#{u+1}item#{i+1}",
          "manuscript" => manuscript
        }
      }

    end

  end  

end

module Jekyll::Witnesses

  def witnesses(input)

    site = Jekyll.sites.first

    return 'foo'
  end

end
Liquid::Template.register_filter(Jekyll::Witnesses)