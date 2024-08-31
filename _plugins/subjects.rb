Jekyll::Hooks.register :site, :pre_render do |site|

  site.collections["subjects"].docs.each do |subject|

    subject.data["key"] = subject.path.partition("_subjects/").last.split("/").last.partition(".").first
    subject.data["type"] = subject.path.partition("_subjects/").last.split("/").first

    unless subject.data["name"].include? "gez"
      subject.data["name"] = { "gez" => subject.data["name"], "en" => subject.data["name"].gsub(/za-/, 'of ') }
    end

  end

  types = site.collections["subjects"].docs.map{|subject| subject.data["type"]}.uniq

  types.each do |type|

    case type
    when "trinitarian", "marian", "angelic"
      title = "#{type.capitalize} Subjects"
    when "prophet", "apostle"
      type = "prophets-apostles"
      title = "Prophets and Apostles"
    when "martyr"
      title = "Martyrs"
    end

    unless title then title = type.capitalize end

    site.pages << Jekyll::PageWithoutAFile.new(site, site.source, "subjects/#{type}#{type == 'martyr' ? 's' : nil}", "index.html").tap do |file|

      file.data["layout"] = "subjects"
      file.data["type"] = type
      file.data["title"] = title

    end

  end

end