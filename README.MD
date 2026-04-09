# 🧩 **README.md — HCP Terraform Local-Free Lab**

## 🚀 Descripción

Este proyecto es un laboratorio diseñado para **probar HCP Terraform sin depender de AWS, Azure, GCP o LocalStack**.  
Todos los recursos utilizan providers que **no requieren red, credenciales ni endpoints**, lo que garantiza que los planes y applies remotos funcionen correctamente dentro del entorno aislado de HCP Terraform.

Incluye:

- Generación de contraseñas aleatorias  
- Generación de llaves RSA  
- Creación de archivos dentro del contenedor remoto  
- Recursos nulos para probar triggers  
- Delays para visualizar ejecuciones  
- Variables y outputs bien estructurados  

Ideal para:

- Practicar Terraform remoto  
- Probar módulos  
- Validar sintaxis  
- Entender dependencias  
- Enseñar Terraform sin necesidad de una nube real  

---

## 📁 Estructura del proyecto

```
.
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

## 🛠 Providers utilizados

Todos son **seguros para HCP Terraform**:

| Provider | Uso |
|---------|-----|
| `random` | Generación de strings aleatorios |
| `tls` | Llaves RSA |
| `local` | Archivos dentro del contenedor remoto |
| `null` | Triggers y dependencias |
| `time` | Delays controlados |

---

## 📦 Requisitos

- Cuenta en **HCP Terraform**
- Workspace configurado (ya incluido en `providers.tf`)
- Terraform CLI (solo para inicializar y enviar runs)

---

## ▶️ Cómo ejecutar

### 1. Inicializar el proyecto

```sh
terraform init
```

### 2. Ejecutar un plan remoto

```sh
terraform plan
```

### 3. Aplicar cambios

```sh
terraform apply
```

---

## 🔧 Variables principales

| Variable | Tipo | Default | Descripción |
|---------|------|---------|-------------|
| `environment` | string | `"hcp"` | Nombre del entorno |
| `string_length` | number | `16` | Longitud del string aleatorio |
| `include_special_chars` | bool | `true` | Incluir caracteres especiales |
| `owner_name` | string | `"Aldo"` | Nombre para plantillas |
| `secret_note` | string | `"valor-secreto"` | Texto sensible |

Puedes sobrescribirlas:

```sh
terraform plan -var="owner_name=AldoDev"
```

---

## 📤 Outputs generados

| Output | Descripción |
|--------|-------------|
| `password` | Password generado (sensible) |
| `public_key` | Llave pública RSA |
| `archivo_generado` | Nombre del archivo creado |
| `environment` | Entorno actual |
| `key_fingerprint` | Huella MD5 de la llave |
| `secret_note_masked` | Placeholder seguro |

---

## 📄 Archivo generado en HCP

El recurso `local_file` crea un archivo dentro del contenedor remoto:

```
info.txt
```

Puedes verlo en los logs del run o descargarlo desde la interfaz de HCP Terraform.

---

## 🎯 Objetivo del laboratorio

Este proyecto demuestra cómo:

- Ejecutar Terraform en HCP sin depender de nubes reales  
- Probar flujos, dependencias y outputs  
- Crear archivos y llaves dentro del entorno remoto  
- Usar variables y outputs de forma profesional  
- Mantener un proyecto 100% portable  

---

## 🧠 Notas finales

Este laboratorio es ideal para:

- Practicar Terraform sin gastar en AWS  
- Enseñar conceptos sin infraestructura real  
- Validar módulos antes de integrarlos con nubes  
- Probar HCP Terraform sin fricción  
