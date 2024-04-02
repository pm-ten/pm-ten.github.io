# Editor's Workflow
1. Gather all content information (texts, metadata, images)
2. Prepare the image(s) according to the specifications listed in the Reference section
3. Add the image(s) in the subfolder of the *media* folder specific for the content type
4. Insert the content metadata in the corresponding metadata file
5. Create both the English and the Italian pages
    1. Add a markdown or an html file in the subfolder of the *pages* folder specific for the content type and the language
    2. Add a **front matter** section at the beginning, including the *key* and the *title* (same value as the metadata file)
    3. Add the page content using the proper syntax (Markdown or HTML respectively)


# Reference

## News

The metadata file is at [/_data/news.yml](/_data/news.yml).

News pages must be saved in [_pages/news](/_pages/news), in the corresponding localized folder.

### Metadata Fields

| Field Name | Field Type | Localized | Description
| -- | -- | -- | --
| key | string | no | Unique identifier. Use the **news-** prefix. This must be equal to the *key* page field.
| title | string | yes | Use the same value as the *title* page field.
| abstract | string | yes | A short summary description.
| date | date | no | Use the **yyyy-mm-dd** pattern.
| image | string | no | Path to the main image. This should be relative to the root folder, e.g. *media/news/sample.jpg*.
| hideFromHomePage | boolean | no | Optional field. If **true**, the news is not included in the news rollup for the home page.


### Page Fields

| Field Name | Field Type | Description
| -- | -- | --
| key | string | Unique identifier. Use the **news-** prefix. This must be equal to the *key* metadata field.
| title | string | Use the same value as the *title* metadata field.

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
| title | string | yes | Use the same value as the *title* page field.
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
| title | string | Use the same value as the *title* metadata field.

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
| title | string | yes | First Name and Last Name. Use the same value as the *title* page field.
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
| title | string | Use the same value as the *title* metadata field.

### Images

People images must be saved in [media/people](/media/people).

| Setting | Value | Notes
| -- | -- | --
| Main Image Width | 400px |
| Main Image Height | 400px |