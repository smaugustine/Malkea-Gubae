require 'octokit' if Jekyll::env == 'production'

Jekyll::Hooks.register :site, :pre_render do |site|

  if Jekyll::env == 'production' then git = Octokit::Client.new(:access_token => ENV["GH_TOKEN"]) end

  site.config['last_modified'] = DateTime.now.to_s

  site.collections['works'].docs.each do |work|

    if Jekyll::env == 'production'
    
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

  end

end