#!/bin/bash

# 1. Limpiamos el taller por si quedó aceite de una vuelta anterior
rm -rf out

# 2. Configuramos el motor usando el parámetro que le pasemos (tu rsuntk-a04_defconfig)
make -C $(pwd) O=$(pwd)/out $1

# 3. Mandamos mecha con todos los núcleos del servidor
make -C $(pwd) O=$(pwd)/out -j$(nproc --all)

# 4. Ponemos el trofeo en su lugar
mkdir -p $(pwd)/arch/arm64/boot/
cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
