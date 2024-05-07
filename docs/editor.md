# Editor's Workflow
1. Gather all content information (texts, metadata, images)
2. Prepare the image(s) according to the specifications listed in the Reference section
3. Add the image(s) in the subfolder of the *media* folder specific for the content type
4. Insert the content metadata in the corresponding metadata file
5. Create both the English and the Italian pages
    1. Add a markdown or an html file in the subfolder of the *pages* folder specific for the content type and the language
    2. Add a **front matter** section at the beginning, including the *key* and the *title* (same value as the metadata file)
    3. Add the page content using the proper syntax (Markdown or HTML respectively)
6. Apply SEO settings, if needed

# Pages and Site Sections

## News

The metadata file is at [/_data/news.yml](/_data/news.yml).

News pages must be saved in [_pages/news](/_pages/news), in the corresponding localized folder.

### Metadata Fields

| Field Name | Field Type | Localized | Description
| -- | -- | -- | --
| key | string | no | Unique identifier. Use the **news-** prefix. This must be equal to the *key* page field.
| title | string | yes | The page title.
| abstract | string | yes | A short summary description.
| date | date | no | Use the **yyyy-mm-dd** pattern.
| image | string | no | Path to the main image. This should be relative to the root folder, e.g. *media/news/sample.jpg*.
| hideFromHomePage | boolean | no | Optional field. If **true**, the news is not included in the news rollup for the home page.


### Page Fields

| Field Name | Field Type | Description
| -- | -- | --
| key | string | Unique identifier. Use the **news-** prefix. This must be equal to the *key* metadata field.

### Images

News images must be saved in [media/news](/media/news).

| Setting | Value | Notes
| -- | -- | --
| Image Width | 625px |
| Image Height | 500px |


## Projects

The metadata file is at [/_data/projects.yml](/_data/projects.yml).

Project pages must be saved in [_pages/projects](/_pages/projects), in the corresponding localized folder.

### Metadata Fields

| Field Name | Field Type | Localized | Description
| -- | -- | -- | --
| key | string | no | Unique identifier. Use the **project-** prefix. This must be equal to the *key* page field.
| title | string | yes | The page title.
| image | string | no | Path to the main image. This should be relative to the root folder, e.g. *media/projects/sample.jpg*.
| image_bottom | string | no | Path to the bottom image. This should be relative to the root folder, e.g. *media/projects/sample_bottom.jpg*.
| type | string | yes |
| partners | array of *partner* | no |
| partner->title | string | no |
| partner->url | string | no |
| partner->newtab | boolean | no | If **true**, the link opens in a new browser tab.
| duration | string | yes |
| sector | string | yes |
| sort | number | no | Sort order (lower values are shown first)


### Page Fields

| Field Name | Field Type | Description
| -- | -- | --
| key | string | Unique identifier. Use the **project-** prefix. This must be equal to the *key* metadata field.

### Images

Project images must be saved in [media/projects](/media/projects).

| Setting | Value | Notes
| -- | -- | --
| Main Image Width | 625px |
| Main Image Height | 500px |
| Bottom Image Max Width | 740px |

## People (Persons)

The metadata file is at [/_data/people.yml](/_data/people.yml).

People pages must be saved in [_pages/people](/_pages/people), in the corresponding localized folder.

### Metadata Fields

| Field Name | Field Type | Localized | Description
| -- | -- | -- | --
| key | string | no | Unique identifier. Use the **people-** prefix. This must be equal to the *key* page field.
| title | string | yes | The page title.
| role | string | yes | Job Role.
| location | string | no | Work Address.
| phone | string | no | Landline Phone.
| mobile | string | no | Mobile Phone.
| mail | string | no | Work Email.
| image | string | no | Path to the main image. This should be relative to the root folder, e.g. *media/people/sample.jpg*.
| sort | number | no | Sort order (lower values are shown first)

### Page Fields

| Field Name | Field Type | Description
| -- | -- | --
| key | string | Unique identifier. Use the **people-** prefix. This must be equal to the *key* metadata field.

### Images

People images must be saved in [media/people](/media/people).

| Setting | Value | Notes
| -- | -- | --
| Main Image Width | 400px |
| Main Image Height | 400px |

## Services

The metadata file is at [/_data/services.yml](/_data/projects.yml).

Service pages must be saved in [_pages/services](/_pages/services), in the corresponding localized folder.

### Metadata Fields

| Field Name | Field Type | Localized | Description
| -- | -- | -- | --
| key | string | no | Unique identifier. Use the **project-** prefix. This must be equal to the *key* page field.
| title | string | yes | The page title.
| abstract | string | yes | A short summary description.
| icon | string | yes | The bootstrap icon class (see [Bootstrap Icons](https://icons.getbootstrap.com/))
| sort | number | no | Sort order (lower values are shown first)


### Page Fields

| Field Name | Field Type | Description
| -- | -- | --
| key | string | Unique identifier. Use the **service-** prefix. This must be equal to the *key* metadata field.

### Images

Project images must be saved in [media/services](/media/services).

| Setting | Value | Notes
| -- | -- | --
| Image Width | 600px |
| Image Height | 400px |

## About Us (Focus On)

The About Us section of the Home Page is not generated out of metadata files or markdown pages.

Instead, the section is included "verbatim" from:
1. [_includes/home-focus-en.html](/_includes/home-focus-en.html) (English Version)
2. [_includes/home-focus-it.html](/_includes/home-focus-it.html) (Italian Version)

# SEO settings

All site pages include the following Search Engine Optimization attributes:

1. Title (HTML title tag)
2. Description (HTML meta tag)
3. Keywords (HTML meta tag)
4. Canonical Url (HTML link, automatically generated)
5. Related languages (HTML link, automatically generated)

Additionally, all site pages can be (and are, by default) included in the sitemap.xml file.

These settings can be specified at the site, metadata or page level. Page-level attributes take precedence over metadata-level attributes, which in turn take precedence over site-level attributes.

This means that a value set at the site level will apply to all pages, unless a more specific value is specified at the metadata or at the page level.

The basic structure for SEO attributes is:

       seo:
            description: 
                en: "description"
                it: "descrizione"
            keywords: 
                en: "one,two,three"
                it: "uno,due,tre"
        sitemap: true|false


| Field Name | Field Type | Localized | Description
| -- | -- | -- | --
| description | string | yes | The page description (mapped to the *description* meta tag).
| keywords | string | yes | A comma separated list of keywords (mapped to the *keywords* meta tag).
| sitemap | boolean | no | If this flag is true, the page is included in the sitemap.xml file. Pages are included by default, since this flag is set on a per/location basis in the _config.xml file for all known paths.

In addition to the basic attributes listed above, you can specify further settings for the sitemap.xml file generation at the site level only:

| Field Name | Field Type | Localized | Description
| -- | -- | -- | --
| additional_files_for_sitemap | array of strings | no | A list files (paths relative to the project root) that are served by the site and must be included in the auto-generated sitemap. Pages and files in the download section are already included, therefore they should *NOT* by added here.

The site-level configuration is at [_data/seo.yml](/_data/seo.yml)

