
{{- define "node-app.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "node-app.fullname" -}}
{{ printf "%s-%s" .Release.Name (include "node-app.name" .) }}
{{- end }}
