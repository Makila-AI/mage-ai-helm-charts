{{/*
Expand the name of the chart.
*/}}
{{- define "mageai.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mageai.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mageai.labels" -}}
helm.sh/chart: {{ include "mageai.chart" . }}
{{ include "mageai.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mageai.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mageai.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
