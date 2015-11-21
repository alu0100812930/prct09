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
end
