require 'open-uri'
require 'json'

module Bibliography

  class Generator < Jekyll::Generator
    def generate(site)

      begin
        zotero_collections = URI.open('https://api.zotero.org/groups/5599348/collections?v=3').read
        zotero_collections = JSON.parse(zotero_collections)
        zotero_collections.map!{ |collection| collection['data'] }

        site.collections['works'].docs.each do |work|
          
          work_id = work.data['title']

          zotero_collection = zotero_collections.find{|collection| collection['name'] == work_id }
          
          unless zotero_collection.nil?

            work.data['zotero_key'] = zotero_collection['key']

            begin
              work.data['bibliography'] = URI.open("https://api.zotero.org/groups/5599348/collections/#{work.data['zotero_key']}/items?format=bib&v=3").read
            rescue
              work.data['bibliography'] = "<a href=\"https://www.zotero.org/groups/5599348/malkea_gubae/collections/#{work.data['zotero_key']}/\">Open in Zotero</a>."
            end

          end

        end

      rescue
      end

      site.pages << Jekyll::PageWithoutAFile.new(site, site.source, 'bibliography', 'index.html').tap do |file|
        file.data.merge!(
          "title" => "",
          "layout" => "bibliography",
          "bibliographies" => {}
        )

        begin
          file.data['bibliographies']['general'] = URI.open('https://api.zotero.org/groups/5599348/items?tag=general&format=bib&v=3').read
        rescue
          file.data['bibliographies']['general'] = '<a href="https://www.zotero.org/groups/5599348/malkea_gubae/tags/general/library/">Open in Zotero</a>.'
        end

        begin
          file.data['bibliographies']['edition'] = URI.open('https://api.zotero.org/groups/5599348/items?tag=edition&format=bib&v=3').read
        rescue
          file.data['bibliographies']['edition'] = '<a href="https://www.zotero.org/groups/5599348/malkea_gubae/tags/edition/library/">Open in Zotero</a>.'
        end

        begin
          file.data['bibliographies']['translation'] = URI.open('https://api.zotero.org/groups/5599348/items?tag=translation&format=bib&v=3').read
        rescue
          file.data['bibliographies']['translation'] = '<a href="https://www.zotero.org/groups/5599348/malkea_gubae/tags/translation/library/">Open in Zotero</a>.'
        end

        file.output
      end

    end
  end

end