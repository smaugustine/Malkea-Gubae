Jekyll::Hooks.register :site, :pre_render do |site|

  site.collections["works"].docs.each do |work|

    work.data["clavis"] = work.data["title"]

    unless work.data.include? "titles"
      if work.data["type"] == "malkəʾ" || work.data["type"] == "quasi-malkəʾ"

        names = work.data["subjects"].map do |key|
          subject = site.collections["subjects"].docs.find{ |subject| subject.data["key"] == key }
          unless subject.nil?
            subject.data["name"]
          else
            {"gez" => "", "en" => ""}
          end
        end
        
        gez_names = names.map{ |subject| subject["gez"] }.map(&:clone)
        if gez_names.size > 1 then gez_names.last.prepend('wa-') end

        en_names = names.map{ |subject| subject["en"] }.map(&:clone)
        if en_names.size > 1 then en_names.last.prepend('and ') end
        if en_names.size > 2 then en_names = en_names.join(", ") else en_names = en_names.join(" ") end
       
        work.data["titles"] = [{
          "gez" => gez_names.join(" ").prepend("Malkəʾa "),
          "en" => en_names.gsub(/The\s/, "the ").prepend("Image of ")
        }]

      end
    end

    work.data["length"] = work.data["stanzas"].max_by{ |k, v| k }[0]

    unless work.data.include? "complete"

      if work.data.include? "stub"
        work.data["complete"] = false
      elsif work.data["stanzas"].first[0] != 1 or work.data["stanzas"][work.data["length"]].last == " "
        work.data["complete"] = false
      else
        work.data["complete"] = true
      end

    end
    
    if work.data["complete"] then work.data["full_text"] = work.data["stanzas"].size == work.data["length"] end

  end

end