<!--- Collection name and description -->	
@{{if .Data.Info.Name -}}@	
# @{{ .Data.Info.Name | trim }}@	
@{{ end }}@	
@{{ if .Data.Info.Description }}@	
@{{- .Data.Info.Description -}}@	
@{{ end }}@

<!--- Iterate main collection -->

@{{ range $di, $d := .Data.Collections }}@
## @{{ $d.Name | trim  }}@
@{{ $d.Description }}@

<!--- Iterate collection items -->

@{{ range $ii, $item := $d.Items }}@

### @{{ if $item.Name }}@@{{ $item.Request.Method | upper }}@ @{{ $item.Name | trim }}@@{{ end }}@
::: v-pre

@{{ if $item.Request.Description }}@
@{{ $item.Request.Description }}@
@{{ end }}@

@{{ if $item.Request.Body.Mode }}@
Type: `@{{ $item.Request.Body.Mode | upper }}@`
@{{ end }}@
URL: `@{{ $item.Request.URL.Raw | trimQueryParams}}@`

<!--- headers items -->
@{{ if $item.Request.Headers }}@
#### Headers

<!--- Iterate headers items -->
| Key | Description |
| --- |-------------|
@{{ range $ih, $h := $item.Request.Headers -}}@
| @{{ $h.Key }}@ | @{{ $h.Description }}@ |
@{{ end }}@
<!--- End Iterate headers items -->

<!--- End  headers items -->
@{{ end }}@

<!--- Query param items -->
@{{ if $item.Request.URL.Query }}@
#### Query params

<!--- Query param items -->
| Key | Description |
| --- |-------------|
@{{ range $iq, $q := $item.Request.URL.Query -}}@
| @{{ $q.Key }}@ | @{{ $q.Description }}@ |
@{{ end }}@
@{{ end }}@
<!--- End query param items -->

<!--- URL variables items -->
@{{ if $item.Request.URL.Variables }}@
#### URL variables

<!--- URL variables items -->
| Key | Description |
| --- |-------------|
@{{ range $iq, $q := $item.Request.URL.Variables -}}@
| @{{ $q.Key }}@ | @{{ $q.Description }}@ |
@{{ end }}@
@{{ end }}@
<!--- End URL variables items -->

@{{ if $item.Request.BodyDescription }}@
#### Payload Description
@{{ $item.Request.BodyDescription }}@
@{{ end }}@

<!--- Body mode -->
@{{ if $item.Request.Body.Mode}}@
<!--- Raw body data -->
@{{ if eq $item.Request.Body.Mode "raw"}}@
@{{ if $item.Request.Body.Raw }}@
#### RAW Request body

```js        
@{{ $item.Request.Body.Raw }}@
```
@{{ end }}@
@{{ end }}@
<!---End Raw body data -->

<!---FormData -->
@{{ if eq $item.Request.Body.Mode "formdata"}}@
<!--- Formdata items -->
@{{ if $item.Request.Body.FormData }}@
#### Formdata Request body

| Key | Description |
| --- |-------------|
@{{ range $if, $f := $item.Request.Body.FormData -}}@
| @{{ $f.Key }}@ | @{{ $f.Description }}@ |
@{{ end }}@
@{{ end }}@
@{{ end }}@
<!---End FormData -->


<!---x-urlencoded data -->
@{{ if eq $item.Request.Body.Mode "urlencoded"}}@
#### Urlencoded Request body

@{{ if $item.Request.Body.URLEncoded }}@
| Key | Description |
| --- |-------------|
@{{ range $iu, $u := $item.Request.Body.URLEncoded -}}@
| @{{ $u.Key }}@ | @{{ $u.Description }}@ |
@{{ end }}@
@{{ end }}@
@{{ end }}@
<!---End x-urlencoded data -->

<!--- End Body mode -->
@{{ end }}@

<!--- Items response -->
@{{ if $item.Responses }}@
#### Responses
@{{ range $ir, $resp := $item.Responses }}@
@{{ if $resp.Name }}@
Status: @{{ $resp.Name }}@ | Code: @{{ $resp.Code }}@

@{{ end }}@

<!--- response headers items -->
@{{ if $resp.Headers }}@
#### Response Headers

<!--- Iterate response headers items -->
| Key | Value |
| --- | ------|
@{{ range $ih, $h := $resp.Headers -}}@
| @{{ $h.Key }}@ | @{{ $h.Value }}@ |
@{{ end }}@
<!--- End Iterate response headers items -->

<!--- End response headers items -->
@{{ end }}@

@{{ if $resp.BodyDescription }}@
#### Response Description
@{{ $resp.BodyDescription }}@
@{{ end }}@

@{{ if $resp.Body }}@
```js
@{{ $resp.Body }}@
```
@{{ end }}@
@{{ end }}@
:::
---
<!--- End Items response -->
@{{ end }}@

<!--- End Iterate collection items -->
@{{ end }}@

<!--- End Iterate main collection -->
@{{ end }}@

<!--- Variables --->
@{{ if .Data.Variables }}@
#### Available Variables

<!--- Iterate variables -->
| Key | Value | Type |
| --- | ------|-------------|
@{{ range $ih, $v := .Data.Variables -}}@
| @{{ $v.Key }}@ | @{{ $v.Value }}@ | @{{ $v.Type }}@ |
@{{ end }}@
<!--- End Iterate headers items -->

<!--- End  headers items -->
@{{ end }}@

---
[Back to top](#@{{ .Data.Info.Name | trim | glink }}@)
> Generated at: @{{date_time}}@ by [docgen](https://github.com/gaplo917/docgen)