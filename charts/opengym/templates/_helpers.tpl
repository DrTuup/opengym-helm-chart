{{- define "opengym.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "opengym.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "opengym.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "opengym.labels" -}}
{{- $root := .root | default . -}}
{{- $extraLabels := .extraLabels | default dict -}}
{{- $labels := dict
  "helm.sh/chart" (printf "%s-%s" (include "opengym.name" $root) ($root.Chart.Version | replace "+" "_"))
  "app.kubernetes.io/name" (include "opengym.name" $root)
  "app.kubernetes.io/instance" $root.Release.Name
  "app.kubernetes.io/managed-by" $root.Release.Service
-}}
{{- with (coalesce $root.Values.labels $root.Values.extraLabels $root.Values.additionalLabels) -}}
{{- $labels = merge $labels . -}}
{{- end -}}
{{- with $extraLabels -}}
{{- $labels = merge $labels . -}}
{{- end -}}
{{- toYaml $labels -}}
{{- end }}

{{- define "opengym.selectorLabels" -}}
app.kubernetes.io/name: {{ include "opengym.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "opengym.apiImage" -}}
{{- if .Values.api.image.digest -}}
{{ .Values.api.image.repository }}@{{ .Values.api.image.digest }}
{{- else -}}
{{ printf "%s:%s" .Values.api.image.repository (required "api.image.tag or api.image.digest must be set" .Values.api.image.tag) }}
{{- end }}
{{- end }}

{{- define "opengym.webImage" -}}
{{- if .Values.web.image.digest -}}
{{ .Values.web.image.repository }}@{{ .Values.web.image.digest }}
{{- else -}}
{{ printf "%s:%s" .Values.web.image.repository (required "web.image.tag or web.image.digest must be set" .Values.web.image.tag) }}
{{- end }}
{{- end }}
