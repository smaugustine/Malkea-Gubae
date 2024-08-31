require 'json'

Jekyll::Hooks.register :site, :pre_render do |site|

  site.collections["posts"].docs.select{ |post| post.data.key? "iiif" }.each do |post|

    annotation_manifest = {
      "@id" => "#{site.config["url"]}#{post.url}",
      "@type" => "sc:AnnotationList",
      "@context" => "http://iiif.io/api/presentation/2/context.json",
      "resources" => []
    }

    post.data["iiif"]["annotations"].each_with_index do |annotation, index|

      annotation_manifest["resources"].push({
        "@id" => "#{site.config["url"]}#{post.url}##{index}",
        "@type" => "oa:Annotation",
        "dcterms:creator" => site.config["url"],
        "dcterms:created" => DateTime.parse(post.data["date"].to_s).to_s,
        "dcterms:modified" => DateTime.now.to_s,
        "motivation" => [ "oa:commenting" ],
        "on" => [ {
          "within" => {
            "@id" => post.data["iiif"]["manifest"],
            "@type" => "sc:Manifest"
          },
          "@type" => "oa:SpecificResource",
          "full" => annotation["image"],
          "selector" => {
            "@type" => "oa:FragmentSelector",
            "value" => annotation["selector"]
          }
        } ],
        "resource" => [ {
          "@type" => "dctypes:Text",
          "format" => "text/html",
          "chars" => "<p>#{annotation["text"]}</p>"
        } ]
      })

    end

    post.data["iiif_annotations"] = annotation_manifest.to_json

  end

end