
--------------------------------------------------------------------------------
-- XPATH
--------------------------------------------------------------------------------

(: Todos los empleados :)
doc("nombre_apellido.xml")/empleados/empleado

(: Solo nombres :)
doc("nombre_apellido.xml")/empleados/empleado/nombre

(: Nombres y apellidos :)
doc("nombre_apellido.xml")/empleados/empleado/(nombre, apellido)

(: Empleados con salario mayor a 4000000 :)
doc("nombre_apellido.xml")/empleados/empleado[salario > 4000000]

(: Empleados del departamento Administración :)
doc("nombre_apellido.xml")/empleados/empleado[departamento = "Administración"]

--------------------------------------------------------------------------------
-- XQUERY
--------------------------------------------------------------------------------

(: Nombre, apellido y salario :)
for $e in doc("nombre_apellido.xml")/empleados/empleado
return
  <empleado>
    <nombre>{data($e/nombre)}</nombre>
    <apellido>{data($e/apellido)}</apellido>
    <salario>{data($e/salario)}</salario>
  </empleado>

(: Empleados con salario mayor a 4000000 :)
for $e in doc("nombre_apellido.xml")/empleados/empleado
where $e/salario > 4000000
return
  <empleado_salario_alto>
    <nombre>{data($e/nombre)}</nombre>
    <apellido>{data($e/apellido)}</apellido>
    <salario>{data($e/salario)}</salario>
  </empleado_salario_alto>

(: Empleados del departamento Administración :)
for $e in doc("nombre_apellido.xml")/empleados/empleado
where $e/departamento = "Administración"
return
  <empleado_administracion>
    <nombre>{data($e/nombre)}</nombre>
    <apellido>{data($e/apellido)}</apellido>
    <correo>{data($e/correo)}</correo>
    <salario>{data($e/salario)}</salario>
  </empleado_administracion>
