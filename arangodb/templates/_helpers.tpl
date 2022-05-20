{{/* vim: set filetype=mustache: */}}


{{/*
Return the proper Arangodb&trade; image name
*/}}
{{- define "arangodb.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper init container volume-permissions image name
*/}}
{{- define "arangodb.volumePermissions.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.volumePermissions.image "global" .Values.global) }}
{{- end -}}


{{/*
Return the Arangodb&trade; credentials secret.
*/}}
{{- define "arangodb.secretName" -}}
{{- if .Values.auth.existingSecret -}}
    {{- printf "%s" (tpl .Values.auth.existingSecret $) -}}
{{- else -}}
    {{- printf "%s" (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the Arangodb&trade; configuration configmap.
*/}}
{{- define "arangodb.configmapName" -}}
{{- if .Values.arangodb.existingConfiguration -}}
    {{- printf "%s" (tpl .Values.arangodb.existingConfiguration $) -}}
{{- else -}}
    {{- printf "%s" (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the Arangodb&trade; PVC name.
*/}}
{{- define "arangodb.claimName" -}}
{{- if .Values.persistence.existingClaim }}
    {{- printf "%s" (tpl .Values.persistence.existingClaim $) -}}
{{- else -}}
    {{- printf "%s" (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}
