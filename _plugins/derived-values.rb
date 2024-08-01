require 'octokit' if Jekyll::env == 'production'

module DerivedValues
  class Generator < Jekyll::Generator

    def generate(site)

      if Jekyll::env == 'production' then git = Octokit::Client.new(:access_token => ENV["GH_TOKEN"]) end

      site.config['last_modified'] = DateTime.now.to_s

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

      # last modified date according to GitHub
      site.collections['works'].docs.each do |work|

        if Jekyll::env == 'production'
        
          # use octokit instead of git because GH action git logs only have one commit
          commits = git.commits('smaugustine/Malkea-Gubae', options = {
            "path" => work.relative_path,
            "per_page" => 1
          })

          unless commits.size < 1
            work.data['last_modified'] = commits[0][:commit][:committer][:date]
          end

        else
          
          work.data['last_modified'] = DateTime.now.to_s

        end

        # propagate subject data
        if work.data.include? 'subjects'
          work.data['subjects'].map! do |subject_id|
            site.data['subjects'].find{ |subject| subject['id'] == subject_id }
          end
        end

        # infer title if undefined
        unless work.data.include? 'titles'
          if work.data['type'] == 'malkəʾ'

            gez_names = work.data['subjects'].map{ |subject| subject['name']['gez'] }.map(&:clone)
            if gez_names.size > 1 then gez_names.last.prepend('wa-') end
            
            en_names = work.data['subjects'].map{ |subject| subject['name']['en'] }.map(&:clone)
            if en_names.size > 1 then en_names.last.prepend('and ') end
            if en_names.size > 2 then en_names = en_names.join(", ") else en_names = en_names.join(" ") end

            work.data['titles'] = [{
              "gez" => gez_names.join(" ").prepend('Malkəʾa '),
              "en" => en_names.gsub(/The\s/, 'the ').prepend('Image of ')
            }]

          end
        end

      end

    end
  end
end