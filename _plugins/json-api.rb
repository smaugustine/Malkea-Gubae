require 'json'

module JSONAPI

  class Generator < Jekyll::Generator
    def generate(site)

      site.collections['works'].docs.each do |work|

        site.pages << Jekyll::PageWithoutAFile.new(site, site.source, 'api/json/works', "#{work.data['title']}.json").tap do |file|

          file.data['layout'] = nil
          file.content = JSON.generate({
            "type": "works",
            "id": work.data['title'],
            "attributes": {
              "type": work.data['type'],
              "titles": work.data['titles'],
              "stanzas": work.data['stanzas']
            },
            "relationships": {
              "subjects": work.data['subjects'].map{|subject| {
                "type": "subjects",
                "id": subject['id'],
                "attributes": {
                  "category": subject['category'],
                  "name": subject['name'],
                  "commemorations": subject['commemorations']
                },
                "links": {
                  "self": "#{site.baseurl}/api/json/subjects/#{subject['id']}.json"
                }
              }},
              "bibliography": {
                "type": "collection",
                "id": work.data['zotero_key'],
                "links": {
                  "self": "https://api.zotero.org/groups/5599348/collections/#{work.data['zotero_key']}/items?v=3"
                }
              }
            },
            "links": {
              "self": "#{site.baseurl}/api/json/works/#{work.data['title']}.json"
            },
            "meta": {
              "copyright": "Copyright #{Date.today.year} Augustine Dickinson.",
              "license": 'This work is licensed under Creative Commons Attribution-ShareAlike 4.0 International.'
            }
          })

          file.output

        end

      end

    end
  end

end