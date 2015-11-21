require 'spec_helper'

describe Modules do
 before:all do 
        @libro = Book.new(:author => ["Dave Thomas", "Andy Hunt", "Chad Fowler"], :title => "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide", :series => "The Facets of Ruby", :p_house => "Pragmatic Bookshelf",:edit_num => 4, :p_date => "July 7, 2013", :isbn_num => ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
        @revista= Magazine.new(:author => "CASTAGNINO, Juan M", :title_a => "Técnicas, materiales y aplicaciones en nanotecnología", :title_m => "Acta Bioquímica Clínica Latinoamericana", :volume => "41", :edit_num => 2, :pages => "189-191", :p_date => "abril / junio 2007")
        @diario= Newspaper.new(:author => "AGUAD, Juan", :title_a => "Más cerca", :title_p => "El Mercurio", :p_place => "Santiago", :p_date => "16 de enero de 2008", :pages => "p. 4, Suplemento Deportes", :column => 1)
        @diario2= Newspaper.new(:author => "AGUAD, Juan", :title_a => "Más lejos", :title_p => "El Mercurio", :p_place => "Santiago", :p_date => "24 de enero de 2008", :pages => "p. 4, Suplemento Deportes", :column => 1)
        @edoc= EDoc.new(:author => ["Scott Chacon", "Ben Straub"], :p_date=> 2009, :title => "Pro Git 2009th Edition", :URL => "https://git-scm.com/book/en/v2")
        @listad= DList.new([@libro, @revista, @diario, @diario2, @edoc])
    end
    
    context "Módulo Comparable" do
        it "Las instancias se comparan correctamente de acuerdo al autor o sus autores y al orden alfabético de la letra inicial del primero de ellos" do
        expect(@libro > @revista).to eq(true)
        expect(@libro < @edoc).to eq(true)
        expect(@diario == @diario2).to eq(true)
    end
    end
    
    context "Módulo Enumerable" do
        it "Los nodos guardados en un objeto de la clase DList pueden mostrarse enumerados por un each" do
            cadena = ""
            @listad.each do |node|
                cadena= cadena + "#{node["value"]},"
            end
            expect(cadena).to be == "#{@edoc},#{@diario2},#{@diario},#{@revista},#{@libro},"
        end
        
          it "Los nodos guardados en un objeto de la clase DList pueden mostrarse ordenados alfabéticamente de acuerdo a la letra inicial de sus autores " do
      orden=@listad.sort_by{|node| node["value"]}
      expect(orden[0]["value"]).to be == @diario2
      expect(orden[1]["value"]).to be == @diario
      expect(orden[2]["value"]).to be == @revista
      expect(orden[3]["value"]).to be == @libro
      expect(orden[4]["value"]).to be == @edoc
    end
    
    it "Se puede obtener el nodo con el nombre de autor de mayor orden alfabético guardado en la lista" do
      nodo=@listad.max
    end
    
      end
end
