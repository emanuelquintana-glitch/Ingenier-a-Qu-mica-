#!/bin/bash

# Script para crear archivos .tex, .qmd, .Rmd, .R, .py, .ipynb, etc.
# en la estructura ya existente

echo "Creando archivos en estructura existente..."
echo "============================================"

# Base directory
BASE="MATEMATICAS-ESTRUCTURA"

# Verificar que existe la estructura
if [ ! -d "$BASE" ]; then
    echo "Error: No existe el directorio $BASE"
    exit 1
fi

# Función para crear archivos vacíos en una carpeta
crear_archivos_en_carpeta() {
    local carpeta="$1"
    local nombre=$(basename "$carpeta")
    
    echo "En carpeta: $nombre"
    
    # Crear archivos básicos
    touch "$carpeta/apuntes.tex"
    touch "$carpeta/ejercicios.qmd"
    touch "$carpeta/notas.Rmd"
    touch "$carpeta/analisis.R"
    touch "$carpeta/calculos.py"
    touch "$carpeta/exploracion.ipynb"
    touch "$carpeta/compilar.sh"
    touch "$carpeta/README.md"
    
    # Archivos adicionales según la temática
    case "$nombre" in
        *CONJUNTOS*|*TEORIA*)
            touch "$carpeta/diagramas-venn.tex"
            touch "$carpeta/operaciones-conjuntos.R"
            ;;
        *ECUACIONES*)
            touch "$carpeta/ecuaciones-lineales.py"
            touch "$carpeta/ecuaciones-cuadraticas.R"
            touch "$carpeta/sistemas-ecuaciones.ipynb"
            ;;
        *VECTOR*|*ALGEBRA*)
            touch "$carpeta/vectores-2d.py"
            touch "$carpeta/vectores-3d.R"
            touch "$carpeta/productos-vectoriales.tex"
            ;;
        *FUNCIONES*)
            touch "$carpeta/graficos-funciones.R"
            touch "$carpeta/transformaciones.py"
            touch "$carpeta/limites-continuidad.tex"
            ;;
        *TRIGONOMETRIC*)
            touch "$carpeta/funciones-trigonometricas.py"
            touch "$carpeta/identidades-trigonometricas.tex"
            touch "$carpeta/aplicaciones-trigonometria.Rmd"
            ;;
        *EXPONENCIAL*|*LOGARITMIC*)
            touch "$carpeta/funciones-exponenciales.R"
            touch "$carpeta/funciones-logaritmicas.py"
            touch "$carpeta/modelado-crecimiento.tex"
            ;;
        *DERIVADA*|*CALCULO-DIFERENCIAL*)
            touch "$carpeta/derivadas-basicas.py"
            touch "$carpeta/regla-cadena.R"
            touch "$carpeta/aplicaciones-derivadas.tex"
            ;;
        *INTEGRAL*|*CALCULO-INTEGRAL*)
            touch "$carpeta/integrales-indefinidas.py"
            touch "$carpeta/integrales-definidas.R"
            touch "$carpeta/aplicaciones-integrales.tex"
            ;;
        *SERIES*|*POTENCIAS*)
            touch "$carpeta/series-numericas.R"
            touch "$carpeta/series-potencias.py"
            touch "$carpeta/serie-taylor.tex"
            ;;
        *COMPLEJ*)
            touch "$carpeta/numeros-complejos.py"
            touch "$carpeta/forma-polar.R"
            touch "$carpeta/aplicaciones-complejos.tex"
            ;;
    esac
    
    echo "  Creados archivos en: $nombre"
}

# Función principal para recorrer toda la estructura
crear_archivos_estructura() {
    echo "Recorriendo estructura..."
    echo ""
    
    # Recorrer todas las carpetas de la estructura
    find "$BASE" -type d | while read dir; do
        if [ "$dir" != "$BASE" ]; then
            crear_archivos_en_carpeta "$dir"
        fi
    done
}

# Crear archivos en la raíz principal
echo "Creando archivos en raíz principal..."
touch "$BASE/README.md"
touch "$BASE/compilar-todo.sh"
touch "$BASE/Makefile"
touch "$BASE/requirements.txt"
touch "$BASE/environment.yml"
touch "$BASE/.gitignore"

# Crear plantillas en la raíz
cat > "$BASE/plantilla.tex" << 'EOF'
\documentclass{article}
\begin{document}
\end{document}
EOF

cat > "$BASE/plantilla.qmd" << 'EOF'
---
title: "Título"
---
EOF

# Crear archivos en toda la estructura
crear_archivos_estructura

# Resumen
echo ""
echo "=========================================="
echo "ARCHIVOS CREADOS EXITOSAMENTE"
echo "=========================================="
echo ""
echo "Total de archivos creados:"
echo "- .tex: $(find "$BASE" -name "*.tex" | wc -l)"
echo "- .qmd: $(find "$BASE" -name "*.qmd" | wc -l)"
echo "- .Rmd: $(find "$BASE" -name "*.Rmd" | wc -l)"
echo "- .R: $(find "$BASE" -name "*.R" | wc -l)"
echo "- .py: $(find "$BASE" -name "*.py" | wc -l)"
echo "- .ipynb: $(find "$BASE" -name "*.ipynb" | wc -l)"
echo "- .sh: $(find "$BASE" -name "*.sh" | wc -l)"
echo "- .md: $(find "$BASE" -name "*.md" | wc -l)"
echo ""
echo "Total general: $(find "$BASE" -type f | wc -l) archivos"
echo ""
echo "Estructura actualizada:"
tree "$BASE" -L 2
