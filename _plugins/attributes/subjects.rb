Jekyll::Hooks.register :site, :pre_render do |site|

  calendar = {}

  for month in 1..13 do

    calendar[month] = {}

    for day in 1..30 do

      break if month == 13 and day > 6

      calendar[month][day] = []

    end

  end

  site.collections["subjects"].docs.each do |subject|

    subject.data["key"] = subject.path.partition("_subjects/").last.split("/").last.partition(".").first
    subject.data["type"] = subject.path.partition("_subjects/").last.split("/").first
    
    if subject.path.partition("_subjects/").last.split("/").size > 2

      subject.data["group"] = subject.path.partition("_subjects/").last.split("/")[1]

    end

    unless subject.data["name"].include? "gez"
      subject.data["name"] = { "gez" => subject.data["name"], "en" => subject.data["name"].gsub(/za-/, 'of ') }
    end

    if subject.data.key? "commemorations"
      subject.data["commemorations"].each do |commemoration|

        calendar[commemoration[1]][commemoration[0]].push(subject)

      end
    end

    link = ["/subjects"]

    case subject.data["type"]
    when "martyr"
      link.push("#{subject.data["type"]}s")
    when "prophet", "apostle"
      link.push("prophets-apostles")
    else
      link.push(subject.data["type"])
    end

    if subject.data.key? "group" then link.push(subject.data["group"]) end
    link.push("##{subject.data["key"]}")
    subject.data["link"] = link.join("/")

  end

  types = site.collections["subjects"].docs.map{ |subject| subject.data["type"] }.uniq
  groups = site.collections["subjects"].docs.select{ |subject| subject.data.key? "group" }.map{ |subject| subject.data["group"] }.uniq

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

      file.data["layout"] = "main/subjects"
      file.data["title"] = title
      file.data["type"] = type

    end

  end

  groups.each do |group|

    site.pages << Jekyll::PageWithoutAFile.new(site, site.source, "subjects/righteous/#{group}", "index.html").tap do |file|

      file.data["layout"] = "main/subjects"
      file.data["title"] = "Righteous: #{site.data["groups"][group]}"
      file.data["type"] = "righteous"
      file.data["group"] = group

    end

  end

  site.pages << Jekyll::PageWithoutAFile.new(site, site.source, "subjects", "calendar.html").tap do |file|

    file.data["layout"] = "main/calendar"
    file.data["title"] = "Calendar of Subjects"
    file.data["calendar"] = calendar

  end

end