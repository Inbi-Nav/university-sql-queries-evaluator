# 📊 Análisis de Consultas SQL


## 📈 Resumen
✅ 4 correctas de 11 queries

## ❌ Query 1: Incorrecto
```diff
--- 
+++ 
@@ -1,13 +1,13 @@
-apellido1 | apellido2 | nombre
-Domínguez | Guerrero | Antonio
-Gea | Ruiz | Sonia
-Gutiérrez | López | Juan
-Heller | Pagac | Pedro
-Herman | Pacocha | Daniel
-Hernández | Martínez | Irene
-Herzog | Tremblay | Ramón
-Koss | Bayer | José
-Lakin | Yundt | Inma
-Saez | Vega | Juan
-Sánchez | Pérez | Salvador
-Strosin | Turcotte | Ismael
+nombre | primer_cognom | segon_cognom
+Antonio | Domínguez | Guerrero
+Sonia | Gea | Ruiz
+Juan | Gutiérrez | López
+Pedro | Heller | Pagac
+Daniel | Herman | Pacocha
+Irene | Hernández | Martínez
+Ramón | Herzog | Tremblay
+José | Koss | Bayer
+Inma | Lakin | Yundt
+Juan | Saez | Vega
+Salvador | Sánchez | Pérez
+Ismael | Strosin | Turcotte
```

⏱ Tiempo: 0.40 ms
🔍 No se usó ningún índice en esta consulta.

---

## ❌ Query 2: Incorrecto
```diff
--- 
+++ 
@@ -1,3 +1,3 @@
-nombre | apellido1 | apellido2
+nombre | primer_cognom | segon_cognom
 Pedro | Heller | Pagac
 Ismael | Strosin | Turcotte
```

⏱ Tiempo: 0.30 ms
🔍 No se usó ningún índice en esta consulta.

---

## ❌ Query 3: Incorrecto
```diff
--- 
+++ 
@@ -1,3 +1,3 @@
-id | nombre | apellido1 | apellido2 | fecha_nacimiento
+id | nombre | primer_cognom | segon_cognom | fecha_nacimiento
 7.00 | Ismael | Strosin | Turcotte | 1999-05-24
 22.00 | Antonio | Domínguez | Guerrero | 1999-02-11
```

⏱ Tiempo: 0.33 ms
🔍 No se usó ningún índice en esta consulta.

---

## ❌ Query 4: Incorrecto
```diff
--- 
+++ 
@@ -1,3 +1,3 @@
-nombre | apellido1 | apellido2 | nif
-Antonio | Fahey | Considine | 10485008K
-Guillermo | Ruecker | Upton | 85869555K
+id | nombre | primer_apellido | segundo_apellido | nif
+16.00 | Antonio | Fahey | Considine | 10485008K
+17.00 | Guillermo | Ruecker | Upton | 85869555K
```

⏱ Tiempo: 0.33 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 5: Correcto

⏱ Tiempo: 0.35 ms
✅ Se usó índice(s) en la consulta: id_grado

---

## ✅ Query 6: Correcto

⏱ Tiempo: 0.37 ms
✅ Se usó índice(s) en la consulta: PRIMARY,id_departamento, PRIMARY

---

## ✅ Query 7: Correcto

⏱ Tiempo: 0.53 ms
✅ Se usó índice(s) en la consulta: PRIMARY,nif, PRIMARY, PRIMARY,id_asignatura,id_curso_escolar

---

## ✅ Query 8: Correcto

⏱ Tiempo: 0.37 ms
✅ Se usó índice(s) en la consulta: PRIMARY,id_departamento, id_profesor,id_grado, PRIMARY

---

## ❌ Query 9: Incorrecto
```diff
--- 
+++ 
@@ -1,4 +1,4 @@
-nombre | apellido1 | apellido2
+nombre | primer_cognom | segon_cognom
 Inma | Lakin | Yundt
 Irene | Hernández | Martínez
 Sonia | Gea | Ruiz
```

⏱ Tiempo: 0.36 ms
✅ Se usó índice(s) en la consulta: PRIMARY, PRIMARY,id_curso_escolar

---

## ❌ Query 10: Incorrecto
```diff
--- 
+++ 
@@ -1,4 +1,4 @@
-departamento | apellido1 | apellido2 | nombre
+nombre_departamento | primer_cognom | segon_cognom | nombre_profesor
 Agronomía | Monahan | Murray | Micaela
 Economía y Empresa | Fahey | Considine | Antonio
 Economía y Empresa | Lemke | Rutherford | Cristina
```

⏱ Tiempo: 0.39 ms
✅ Se usó índice(s) en la consulta: PRIMARY

---

## ❌ Query 11: Error
- **Descripción**: 'NoneType' object is not iterable

