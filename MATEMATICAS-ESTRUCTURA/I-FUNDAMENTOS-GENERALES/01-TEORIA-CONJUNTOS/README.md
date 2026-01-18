# Fundamentos Matemáticos: Teoría de Conjuntos y Aplicaciones

![Quarto](https://img.shields.io/badge/Quarto-0.2%2B-brightgreen) 
![R](https://img.shields.io/badge/R-4.5-blue) 
![License](https://img.shields.io/badge/License-MIT-yellow)

Este directorio contiene las notas de estudio digitalizadas correspondientes al **Volumen I de *Mathematik für Ingenieure und Naturwissenschafter*** de Lothar Papula. El documento se enfoca en los fundamentos generales, desde la teoría de conjuntos hasta los sistemas de ecuaciones lineales y métodos numéricos.

El proyecto está escrito en formato **Quarto (`.qmd`)**, permitiendo generar informes en **HTML** (interactivo) y **PDF** (para impresión).

---

##  Contenido Académico

Basado en la estructura propuesta por Papula (2024), este módulo cubre los siguientes temas fundamentales para ingenieros y científicos:

1.  **Teoría de Conjuntos:**
    *   Operaciones elementales: Intersección, Unión y Diferencia.
    *   Representación (extensional e intensional).
    *   Diagramas de Venn generados con `ggforce`.
2.  **Números Reales:**
    *   Estructura de $\mathbb{R}$ (decimales finitos, periódicos, irracionales).
    *   Leyes algebraicas (Conmutativa, Asociativa, Distributiva).
    *   Valor Absoluto e Inecuaciones.
3.  **Teoría de Ecuaciones:**
    *   Lineales y Cuadráticas (Fórmula $p,q$).
    *   Ecuaciones de grado superior, irracionales y con valor absoluto.
4.  **Sistemas de Ecuaciones Lineales (LGS):**
    *   Algoritmo de Gauss y Regla de Cramer.
    *   Aplicación práctica: Análisis de circuitos eléctricos (Leyes de Kirchhoff).
5.  **Métodos Numéricos:**
    *   Método de Newton (Tangentenverfahren).
6.  **Combinatoria:**
    *   Triángulo de Pascal y Binomio de Newton.

---

## ️ Requisitos Previos

Para compilar este documento correctamente, necesitas tener instalado el siguiente software en tu sistema:

1.  **Quarto**: (`>= 1.4`)
2.  **R / RStudio**: (Versión 4.0 o superior)
3.  **TinyTeX** o **TeX Live** (para la generación de PDF vía XeLaTeX)

---

##  Instalación de Librerías R

El código utiliza paquetes de visualización avanzada. Asegúrate de ejecutar el siguiente comando en R o RStudio antes de renderizar por primera vez:

```r
install.packages(c(
  "ggplot2",      # Gráficos estándar
  "ggforce",      # Para círculos en diagramas de Venn
  "patchwork",    # Para combinar múltiples gráficos
  "knitr",        # Motor de integración de R
  "tidyverse"     # Manejo de datos
))
```

---

##  Cómo Compilar

Existen dos formas principales de generar el documento en esta carpeta:

### Opción A: Usar el script incluido (Recomendado)
Ejecuta el script Bash que automatiza el proceso:

```bash
./compilar.sh
```

### Opción B: Usar Quarto directamente
Genera tanto la versión web como la versión PDF para imprimir:

```bash
quarto render notas.qmd
```

**Nota sobre la compilación:** 
El archivo `notas.qmd` está configurado para generar un PDF en formato **dos columnas** (estilo periódico/científico). Si experimentas problemas con la instalación de fuentes LaTeX (como `libertinus`), asegúrate de que los archivos `apa.csl` y `referencias.bib` estén en la misma carpeta.

---

##  Estructura de Archivos

```text
.
├── notas.qmd               # Archivo fuente principal (Quarto Markdown)
├── notas.html              # Documento web renderizado
├── notas.pdf               # Documento final para impresión
├── referencias.bib         # Bibliografía BibTeX (Papula 2024)
├── apa.csl                 # Estilo de citación APA (descargado)
├── custom.scss             # Personalización de estilos para HTML
├── styles.css              # Estilos CSS adicionales
├── notas_files/            # Carpeta generada con las figuras (png/pdf)
│   ├── figure-html/
│   └── figure-pdf/
├── analisis.R              # Scripts auxiliares de análisis
├── operaciones-conjuntos.R
└── README.md               # Este archivo
```

---

##  Detalles Técnicos de la Configuración

*   **Motor PDF:** Utiliza `xelatex` para manejar correctamente caracteres especiales y matemáticas complejas.
*   **Gráficos:** Los gráficos se generan dinámicamente usando R y se exportan a PNG (para HTML) y PDF (para el documento final) de alta calidad.
*   **Tablas:** Se ha configurado `longtable: false` en el YAML para asegurar que las tablas se rendericen correctamente en el diseño de dos columnas.

---

##  Autoría y Referencias

Este material es una adaptación y digitalización para fines académicos.

**Autor del Documento:** [Emanuel Quintana Silva](https://orcid.org/0009-0006-8419-2805)  
**Afiliación:** Universidad Pedagógica y Tecnológica de Colombia (UPTC)  
**Especialización:** Econometría Computacional | Aplicaciones R/Python

**Fuente Primaria:**  
Papula, L. (2024). *Mathematik für Ingenieure und Naturwissenschaftler, Band 1*. Springer Vieweg.  
DOI: [10.1007/978-3-658-45802-7](https://doi.org/10.1007/978-3-658-45802-7)

---

##  Licencia

Este proyecto está bajo la Licencia MIT.
