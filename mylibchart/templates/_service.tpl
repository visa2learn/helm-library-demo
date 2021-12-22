{{ define "mylibchart.service" }}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "mylibchart.fullname" . }}
  labels:
    {{- include "mylibchart.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "mylibchart.selectorLabels" . | nindent 4 }}
{{- end }}