# መልክአ፡ ጉባኤ፡ *(Malkəʾa Gubāʾe)*

[MalkeaGubae.com](https://malkeagubae.com) is a website cataloguing, indexing, and describing all known *malkəʾ* and related poetry from the Ethiopic hymnographic tradition.

The encoding of the data along with the development and design of the website has all been undertaken by [Augustine Dickinson](https://augustinedickinson.com).

## API

Two APIs are available for accessing data:

### XML

Data for work records is available in XML format following the [TEI](https://tei-c.org/) P5 guidelines.

The endpoint URL is `api/xml/works/{id}.xml` where `{id}` is the work's number according to *Clavis Aethiopica*.

### JSON

Data for work and subject records is available in JSON format following a format based on the [JSON:API](https://jsonapi.org/) specification. Note that there is no support for extra queries or other advanced features as the files are served statically.

For works, the endpoint URL is `api/json/works/{id}.json` where `{id}` is the work's number according to *Clavis Aethiopica*.

For subjects, the endpoint URL is `api/json/subjects/{id}.json` where `{id}` is the site's internal ID for the subject, corresponding to `https://malkeagubae.com/subjects/{category}/#{id}`.

## Bibliography

All bibliographic data is stored and retrieved from the site's public [Zotero library](https://www.zotero.org/groups/5599348/malka_gube/library).

# ጽሑፋነ፡ መልክእ፡ *(Ṣəḥufāna Malkəʾ)*

[Ṣəḥufāna Malkəʾ](https://malkeagubae.com/blog) is a blog run by [Augustine Dickinson](https://augustinedickinson.com) featuring posts with in-depth discussions of *malkəʾ* and related poetry, both with respect to their contents and style as well as the manuscripts and books that preserve them.