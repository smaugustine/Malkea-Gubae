module DerivedValues
  class Generator < Jekyll::Generator
    def generate(site)

      site.collections['subjects'].docs.each do |category|
        if category.data.include? 'subjects'

          category.data['subjects'].map! do |subject|
            subject['works'] = site.collections['works'].docs.select{ |work| work['subjects'].include? subject['id'] } # propagate work data

            unless subject['name'].include? 'gez'
              subject['name'] = { "gez" => subject['name'], "en" => subject['name'].gsub(/za-/, 'of ') } # infer names
            end

            subject 
          end

          # generate full list of subjects
          site.data['subjects'] = site.data['subjects'].concat(
            category.data['subjects'].map do |subject|
              subject['url'] = "#{category.url}##{subject['id']}"
              subject['category'] = category.url.split('/')[2].split('-').map(&:capitalize).join('/')
              subject['commemorations'] = subject['commemorations'].to_a.map{ |date| "#{date[0]}/#{date[1]}" } # stringify commemorations for easier searching
              subject 
            end
          )

        end
      end

      site.collections['works'].docs.each do |work|

        # propagate subject data
        if work.data.include? 'subjects'
          work.data['subjects'].map! do |subject_id|
            site.data['subjects'].find{ |subject| subject['id'] == subject_id }
          end
        end

        # infer title if undefined
        unless work.data.include? 'titles'
          if work.data['type'] == 'malkəʾ'

            gez_names = work.data['subjects'].map{ |subject| subject['name']['gez'] }
            if gez_names.size > 1 then gez_names.last.prepend('wa-') end
            
            en_names = work.data['subjects'].map{ |subject| subject['name']['en'] }
            if en_names.size > 1 then en_names.last.prepend('and ') end

            work.data['titles'] = [{
              "gez" => gez_names.join(" ").prepend('Malkəʾa '),
              "en" => en_names.join(", ").gsub(/The\s/, 'the ').prepend('Image of ')
            }]

          end
        end

      end

    end
  end
end