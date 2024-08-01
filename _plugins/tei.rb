require 'open-uri'

module TEI

  class Generator < Jekyll::Generator
    def generate(site)

      site.collections['works'].docs.each do |work|

        site.pages << Jekyll::PageWithoutAFile.new(site, site.source, 'api/xml/works', "#{work.data['title']}.xml").tap do |file|

          file.data.merge!(work.data)
          file.data['layout'] = 'api/tei'

          if work.data.include? 'zotero_key'
            begin
              raise "Skipping Zotero API call in development environment" if Jekyll::env == 'development'
              file.data['bibliography'] = URI.open("https://api.zotero.org/groups/5599348/collections/#{work.data['zotero_key']}/items?v=3&format=tei").read.gsub!(/<\?.+\?>/, '')
            rescue
              file.data.delete('bibliography')
            end
          end

          file.output

        end

      end

    end
  end

end