require 'json'

module JSONAPI

  class Generator < Jekyll::Generator
    def generate(site)

      site.collections['works'].docs.each do |work|

        site.pages << Jekyll::PageWithoutAFile.new(site, site.source, 'api/json/works', "#{work.data['title']}.json").tap do |file|

          file.data.merge!(work.data)
          file.data['layout'] = 'api/jsonapi'

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
  end

end