class Biblioref
  include Comparable
  attr_accessor :author
      attr_accessor :title
      attr_accessor :series
      attr_accessor :p_house #Casa editorial
      attr_accessor :edit_num #Numero de edición
      attr_accessor :p_date #Fecha de publicación
      attr_accessor :isbn_num #Números isbn
      def initialize(params = {})
          @author = []
          if params.fetch(:author, nil).class.to_s=="Array"
            for i in 0..params.fetch(:author, nil).count-1
            @author << params.fetch(:author, nil)[i]
          end
          else
            @author << params.fetch(:author, nil)
          end
          @title = params.fetch(:title,nil)
          @series= params.fetch(:series, nil)
          @p_house = params.fetch(:p_house, nil)
          @edit_num = params.fetch(:edit_num, nil)
          @p_date = params.fetch(:p_date)
          @isbn_num = []
          if params.fetch(:isbn_num, nil).class.to_s=="Array"
            for i in 0..params.fetch(:isbn_num, nil).count-1
            @isbn_num << params.fetch(:isbn_num, nil)[i]
          end
        else
          @isbn_num << params.fetch(:isbn_num, nil)
          end
          end
          
      def to_s
          names =""
          isbns =""
          i=0
  while i < @author.count
if i != @author.count-1
  names= names + "#{@author[i]}, "
else
  names= names + "#{@author[i]}."
end
  i=i+1
end
i=0
while i < @isbn_num.count
if i != @isbn_num.count-1
  isbns= isbns + "#{@isbn_num[i]}, "
else
  isbns= isbns + "#{@isbn_num[i]}."
end
  i=i+1
end
if series != nil
      "#{names} #{@title}, (#{@series}), #{@p_house}; #{@edit_num} edition (#{@p_date}), #{isbns}"
else
      "#{names} #{@title}, #{@p_house}; #{@edit_num} edition (#{@p_date}), #{isbns}"
    end
    end 
    
     def <=>(another)
      @author<=>another.author
    end
end

class Book < Biblioref
    def initialize(params ={})
        super
    end
    def to_s
        super
end
end

class Magazine < Biblioref
    attr_accessor :title_m, #Título de Magazine
    :title_a, #Título de artículo
    :volume, #Volumen
    :pages #Paginas de artículo
    def initialize(params = {})
        super
        @title_a=params.fetch(:title_a)
        @title_m=params.fetch(:title_m)
        @volume=params.fetch(:volume, "")
        @pages=params.fetch(:pages)
    end
    
    def to_s
          names =""
          i=0
  while i < @author.count
if i != @author.count-1
  names= names + "#{@author[i]}, "
else
  names= names + "#{@author[i]}."
end
  i=i+1
end
i=0
if @volume != ""
      "#{names} #{@title_a}. #{@title_m}. #{@volume} (#{@edit_num}): #{@pages}, (#{@p_date})."
else
      "#{names} #{@title_a}. #{@title_m}. (#{@edit_num}): #{@pages}, (#{@p_date})."
end
    end 
   
end

class Newspaper < Biblioref
  attr_accessor :title_p, #Título de períodico
  :title_a, #Título de artículo
  :p_place, #Lugar de publicación
  :pages, #Paginación
  :column #Columna
  def initialize(params = {})
    super
    @title_p = params.fetch(:title_p)
    @title_a=params.fetch(:title_a)
    @p_place = params.fetch(:p_place)
    @pages = params.fetch(:pages)
    @column = params.fetch(:column)
  end
  
        def to_s
          names =""
          i=0
  while i < @author.count
if i != @author.count-1
  names= names + "#{@author[i]}, "
else
  names= names + "#{@author[i]}."
end
  i=i+1
  end
i=0

      "#{names} #{@title_a}. #{@title_p}, #{@p_place}, #{@p_date}, #{@pages}, col. #{@column}."
   end
    
end

class EDoc < Biblioref
   attr_accessor :url #Dirección de documento electrónico
    def initialize(params ={})
        super
        @url=params.fetch(:URL)
    end
    
      def to_s
          names =""
          isbns =""
          i=0
  while i < @author.count
if i != @author.count-1
  names= names + "#{@author[i]}, "
else
  names= names + "#{@author[i]}."
end
  i=i+1
end
i=0
while i < @isbn_num.count
  if i != @isbn_num.count-1
  isbns= isbns + "#{@isbn_num[i]}, "
else
  isbns= isbns + "#{@isbn_num[i]}."
end
  i=i+1
end

      "#{names} #{@p_date}. #{@title}. Available on: #{@url} ."
 end
     
end