require 'open-uri'
require 'json'

module Bibliography

  class Generator < Jekyll::Generator
    def generate(site)

      begin
        zotero_collections = []
        api_url = 'https://api.zotero.org/groups/5599348/collections?v=3'

        loop do

          response = URI.open(api_url)
          zotero_collections.concat(JSON.parse(response.read))

          header_links = response.meta['link']
          api_url = header_links.gsub(/.*<(.+?)>; rel="next".*/, '\1')
         
        break if !header_links.include? "next"
         
        end

        zotero_collections.map!{ |collection| collection['data'] }

        site.collections['works'].docs.each do |work|
          
          work_id = work.data['title']

          zotero_collection = zotero_collections.find{ |collection| collection['name'] == work_id }
          
          unless zotero_collection.nil?

            work.data['zotero_key'] = zotero_collection['key']

            begin
              raise "Skipping Zotero API call in development environment" if Jekyll::env == 'development'
              work.data['bibliography'] = URI.open("https://api.zotero.org/groups/5599348/collections/#{work.data['zotero_key']}/items?format=bib&v=3").read
            rescue
              work.data['bibliography'] = "<a href=\"https://www.zotero.org/groups/5599348/malkəʾa_gubāʾe/collections/#{work.data['zotero_key']}/\" target=\"_blank\">Open in Zotero</a>."
            end

          end

        end

      rescue
      end

      site.pages << Jekyll::PageWithoutAFile.new(site, site.source, 'bibliography', 'index.html').tap do |file|
        file.data.merge!(
          "title" => "",
          "layout" => "main/bibliography",
          "bibliographies" => {}
        )

        begin
          file.data['bibliographies']['general'] = URI.open('https://api.zotero.org/groups/5599348/items?tag=general&format=bib&v=3').read
        rescue
          file.data['bibliographies']['general'] = '<a href="https://www.zotero.org/groups/5599348/malkea_gubae/tags/general/library/" target="_blank">Open in Zotero</a>.'
        end

        begin
          file.data['bibliographies']['edition'] = URI.open('https://api.zotero.org/groups/5599348/items?tag=edition&format=bib&v=3').read
        rescue
          file.data['bibliographies']['edition'] = '<a href="https://www.zotero.org/groups/5599348/malkea_gubae/tags/edition/library/" target="_blank">Open in Zotero</a>.'
        end

        begin
          file.data['bibliographies']['translation'] = URI.open('https://api.zotero.org/groups/5599348/items?tag=translation&format=bib&v=3').read
        rescue
          file.data['bibliographies']['translation'] = '<a href="https://www.zotero.org/groups/5599348/malkea_gubae/tags/translation/library/" target="_blank">Open in Zotero</a>.'
        end

        file.output
      end

    end
  end

end