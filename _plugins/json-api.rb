#require 'json'

Jekyll::Hooks.register :site, :pre_render do |site|

  site.collections['works'].docs.each do |work|

    site.pages << Jekyll::PageWithoutAFile.new(site, site.source, 'api/json/works', "#{work.data['title']}.json").tap do |file|

      file.data.merge!(work.data)
      file.data['layout'] = 'api/works/jsonapi'

      file.output

    end

  end

  # subjects

  # JSON.generate({
  #   "type": "subjects",
  #   "id": subject.data['id'],
  #   "attributes": {
  #     "type": subject.data['category']
  #   },
  #   relationships: { }
  # })

end