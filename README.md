Lenguajes y Paradigmas de Programación
==================


Práctica 9 - POO: Módulos
-----------

Autor:

* Mauricio Orta

Descripción
----------------------

Este repositorio contiene un árbol de directorios y ficheros creados con la herramienta Bundler, la cual organiza la estructura necesaria para 
poder obtener una "gema" o librería de ruby.

Se incluyen dos ficheros con clases en lib/modules El primero es references.rb, el cual consta de una clase padre Biblioref que representa a referencias bibliográficas
y clases hijas Book, Magazine, Newspaper y EDoc que la heredan, las cuales representan referencias de libros, artículos de revista, artículos de periódico y documentos
electrónicos respectivamente. Esta jerarquía de clases está modificada de tal manera que sus instancias comparables a través de la integración con el módulo "Comparable"

El segundo fichero de clase es doubly_list, el contiene la clase DList, la cual como sugiere el nombre de su fichero posee el comportamiento de
una lista doblemente enlazada, con un enlace al nodo anterior además del siguiente para cada nodo de la lista. Esta clase está modificada de tal 
manera que sus instancias son enumerables a través de la integración con el módulo "Enumerable".


Finalmente, existe un fichero de expectativas modules_spec.rb en el directorio spec, el cual contiene grupos de ejemplos de expectativas
que se fueron escribiendo a medida que se desarrollaba el código para verificar y evaluar su funcionamiento. También se instaló y se configuró en el
proyecto la herramienta de integración continua Travis, incluyendo su respectivo fichero .travis.yml.


Árbol de ficheros y directorios
-------------------------------
``` 
.
├── CODE_OF_CONDUCT.md
├── Gemfile
├── LICENSE.txt
├── README.md
├── Rakefile
├── bin
│   ├── console
│   └── setup
├── lib
│   ├── modules
│   │   ├── doubly_list.rb
│   │   ├── references.rb
│   │   └── version.rb
│   └── modules.rb
├── modules.gemspec
└── spec
    ├── modules_spec.rb
    └── spec_helper.rb

``` 
    
---------------------------