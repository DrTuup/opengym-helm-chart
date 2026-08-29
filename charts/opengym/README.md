# opengym

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.2.11](https://img.shields.io/badge/AppVersion-1.2.11-informational?style=flat-square)

A Helm Chart for deploying openGym on Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity rules. |
| api | object | `{"image":{"digest":"","pullPolicy":"IfNotPresent","repository":"registry.gitlab.com/duartesantos8/opengym/api","tag":"1.2.11"},"labels":{},"livenessProbe":{"initialDelaySeconds":10,"periodSeconds":15,"tcpSocket":{"port":"http"}},"port":3000,"readinessProbe":{"initialDelaySeconds":3,"periodSeconds":5,"tcpSocket":{"port":"http"}},"replicaCount":1,"resources":{"limits":{"memory":"512Mi"},"requests":{"cpu":"100m","memory":"128Mi"}},"service":{"annotations":{},"labels":{},"type":"ClusterIP"}}` | API workload configuration. |
| api.image.digest | string | `""` | Image digest, preferred over tag. |
| api.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| api.image.repository | string | `"registry.gitlab.com/duartesantos8/opengym/api"` | API container image repository. |
| api.image.tag | string | `"1.2.11"` | Immutable image tag. Set either tag or digest. |
| api.labels | object | `{}` | Additional labels for the API Deployment and Service. |
| api.livenessProbe | object | `{"initialDelaySeconds":10,"periodSeconds":15,"tcpSocket":{"port":"http"}}` | API liveness probe. |
| api.port | int | `3000` | API listening port. |
| api.readinessProbe | object | `{"initialDelaySeconds":3,"periodSeconds":5,"tcpSocket":{"port":"http"}}` | API readiness probe. |
| api.replicaCount | int | `1` | Number of API replicas. |
| api.service.annotations | object | `{}` | API Service annotations. |
| api.service.labels | object | `{}` | Additional labels for the API Service. |
| api.service.type | string | `"ClusterIP"` | API Service type. |
| apiStartupProbe | object | `{}` | Optional startup probe settings for the API. |
| config | object | `{"adminUids":"","allowGuest":"","auditDays":90,"auditIp":"off","auditLog":"","auditMax":5000,"dataDir":"/data","inviteOnly":"","labels":{},"origin":"","rpId":"","rpName":"openGym","sessionDays":90,"vapidSubject":""}` | Non-secret application configuration. |
| config.adminUids | string | `""` | Comma-separated user IDs granted administrator access. |
| config.allowGuest | string | `""` | Allow guest mode. Set to "0" to disable it. |
| config.auditDays | int | `90` | Number of days to retain activity log events. Set to 0 for no limit. |
| config.auditIp | string | `"off"` | Activity log IP address mode: off, net, or full. |
| config.auditLog | string | `""` | Enable the activity log. Set to "0" to disable it. |
| config.auditMax | int | `5000` | Maximum number of activity log events. Set to 0 for no limit. |
| config.dataDir | string | `"/data"` | Directory used by the API for persistent data. |
| config.inviteOnly | string | `""` | Require an invite code to create a profile. |
| config.labels | object | `{}` | Additional labels for the application ConfigMap. |
| config.origin | string | `""` | Application origin. Defaults to the HTTPS ingress origin. |
| config.rpId | string | `""` | WebAuthn relying-party ID. Defaults to the ingress host. |
| config.rpName | string | `"openGym"` | Name shown in the passkey prompt. |
| config.sessionDays | int | `90` | Sign-in lifetime in days. |
| config.vapidSubject | string | `""` | Contact address for push notifications. Defaults to the application origin. |
| data | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"labels":{},"storage":"1Gi","storageClassName":""}` | API persistent data volume configuration. |
| data.accessModes | list | `["ReadWriteOnce"]` | PersistentVolumeClaim access modes. |
| data.annotations | object | `{}` | PersistentVolumeClaim annotations. |
| data.labels | object | `{}` | Additional labels for the data PVC. |
| data.storage | string | `"1Gi"` | Requested storage size. |
| data.storageClassName | string | `""` | Storage class, or empty to use the cluster default. |
| deploymentStrategy | string | `"Recreate"` | ReadWriteOnce persistent volumes during upgrades. |
| fullnameOverride | string | `""` | Override the generated full name. |
| imagePullSecrets | list | `[]` | Image pull secrets for private registries. |
| ingress | object | `{"annotations":{},"className":"","enabled":false,"extraPaths":[],"extraRules":[],"extraTls":[],"host":"","labels":{},"path":"/","pathType":"Prefix","tls":{"enabled":false,"secretName":""}}` | Ingress configuration. |
| ingress.annotations | object | `{}` | Ingress annotations. |
| ingress.className | string | `""` | Ingress class name. |
| ingress.enabled | bool | `false` | Enable the web Ingress. |
| ingress.extraPaths | list | `[]` | Additional paths for the primary host. |
| ingress.extraRules | list | `[]` | Additional Ingress rules. |
| ingress.extraTls | list | `[]` | Additional TLS configurations. |
| ingress.host | string | `""` | Public hostname. |
| ingress.labels | object | `{}` | Additional labels for the Ingress. |
| ingress.path | string | `"/"` | URL path. |
| ingress.pathType | string | `"Prefix"` | URL path matching behavior. |
| ingress.tls.enabled | bool | `false` | Enable TLS. |
| ingress.tls.secretName | string | `""` | TLS Secret managed by cert-manager. |
| labels | object | `{}` | Additional labels to apply to all resources. |
| media | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"labels":{},"loader":{"enabled":true,"image":"alpine/git","imagePullPolicy":"IfNotPresent","repository":"https://github.com/hasaneyldrm/exercises-dataset"},"storage":"512Mi","storageClassName":""}` | Shared exercise media volume configuration. |
| media.accessModes | list | `["ReadWriteOnce"]` | PersistentVolumeClaim access modes. |
| media.annotations | object | `{}` | PersistentVolumeClaim annotations. |
| media.labels | object | `{}` | Additional labels for the media PVC. |
| media.loader.enabled | bool | `true` | Download exercise media into the volume before starting the web pod. |
| media.loader.image | string | `"alpine/git"` | Media loader image. |
| media.loader.imagePullPolicy | string | `"IfNotPresent"` | Media loader image pull policy. |
| media.loader.repository | string | `"https://github.com/hasaneyldrm/exercises-dataset"` | Exercise media repository. |
| media.storage | string | `"512Mi"` | Requested storage size. |
| media.storageClassName | string | `""` | Storage class, or empty to use the cluster default. |
| nameOverride | string | `""` | Override the chart name. |
| nodeSelector | object | `{}` | Node selector. |
| podAnnotations | object | `{}` | Additional pod annotations. |
| podLabels | object | `{}` | Additional pod labels. |
| podSecurityContext | object | `{"seccompProfile":{"type":"RuntimeDefault"}}` | Pod security context. |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}}` | Container security context. |
| tolerations | list | `[]` | Tolerations. |
| web | object | `{"containerPort":80,"image":{"digest":"","pullPolicy":"IfNotPresent","repository":"registry.gitlab.com/duartesantos8/opengym/web","tag":"1.2.11"},"labels":{},"readinessProbe":{"initialDelaySeconds":3,"periodSeconds":5,"tcpSocket":{"port":"http"}},"replicaCount":1,"resources":{"limits":{"memory":"256Mi"},"requests":{"cpu":"100m","memory":"128Mi"}},"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"add":["CHOWN","SETGID","SETUID"],"drop":["ALL"]}},"service":{"annotations":{},"labels":{},"port":8080,"type":"ClusterIP"}}` | Web workload configuration. |
| web.containerPort | int | `80` | Nginx listening port inside the container. |
| web.image.digest | string | `""` | Image digest, preferred over tag. |
| web.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| web.image.repository | string | `"registry.gitlab.com/duartesantos8/opengym/web"` | Web container image repository. |
| web.image.tag | string | `"1.2.11"` | Immutable image tag. Set either tag or digest. |
| web.labels | object | `{}` | Additional labels for the web Deployment and Service. |
| web.readinessProbe | object | `{"initialDelaySeconds":3,"periodSeconds":5,"tcpSocket":{"port":"http"}}` | Web readiness probe. |
| web.replicaCount | int | `1` | Number of web replicas. |
| web.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"add":["CHOWN","SETGID","SETUID"],"drop":["ALL"]}}` | prepare its cache directories. |
| web.service.annotations | object | `{}` | Web Service annotations. |
| web.service.labels | object | `{}` | Additional labels for the web Service. |
| web.service.port | int | `8080` | Web Service port. |
| web.service.type | string | `"ClusterIP"` | Web Service type. |
| webStartupProbe | object | `{}` | Optional startup probe settings for the web container. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
