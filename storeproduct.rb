require 'io/console'
require 'byebug'
require 'pp'
class Product

attr_accessor :product  
  def inputs(num1)
    
    @num1 = num1
    # name = []
    # qty = []
    # price = []
    # name = {}
    # qty = {}
    @product = []
    # price = {}
    # product = {}
    # product[:name] = name
    # puts "#{product[:name]}"
    # product[:qty] = qty
    # product[:price] = price
    for i in 0..num1-1 
      print "\n Enter Product Id: "
      id = gets.to_i
      print "\nEnter Product Name: "
      name = gets.chomp
      puts "\nEnter Product Quantity: "
      qty = gets.to_i
      puts "\nEnter Product Price: "
      price = gets.to_i
      # if File.open('product.txt').each_line.any?{|line| eval(line).find(@product.each {|k| k[:name]})}
      #   print 'Product is Present'
      #   puts "\nEnter Product Quantity: "
      #   qty = gets.to_i
      #   @product.map do |k| 
      #     k[:qty]+=qty
      #   end
      # p File.open("product.txt").each_line.any?{|line| eval(line).find(@product.each {|k| k[:name]})}
        #File.open("product.txt").each_line.any?{|line| eval(line).find(name)}
        # check_prod = 
          # File.open("product.txt").each_line do |line|
          #   #@product.each do |k| 
          #     prod = eval(line)  
          #     if prod.find(prod[:name] == name)
          #       puts "\nEnter Product Quantity: "
          #       qty = gets.to_i
          #       prod[:qty] += qty
          #     else
          #       puts "Not"
          #     end
          #   end
          # else
          #   print "Product is not Present"
          #   puts "\nEnter Product Price"
          #   price = gets.to_i
        # end
      # name[:value] = name
      # product["name"] = name
      # product["qty"] = qty
      # product["price"] = price
      # File.readlines("product.txt").each_with_index do |line|
      #   line.include?(name[i])
      #   if line.include?(name[i])==true
      #     print "\nEnter Quantity: " 
      #     qty[i] = gets.to_i
      #     count=qty[i]
      #     puts "Very"
      #     break
      #   else
      #     print "\nEnter Quantity: " 
      #     qty[i] = gets.to_i
      #     print "\nEnter Price: " 
      #     price[i]=gets.to_i
      #     break
      #   end
      # end
      @product << {id: id, name: name, qty: qty, price: price}
    end
       # puts "#{product}"
    return @product
  end
  def buy_products(num1)
    File.open("buy_product.txt", File::TRUNC) {}
    @num1 = num1
    @buy_product = []
    for i in 0..num1-1 
      print "\nEnter Product Name: "
      name=gets.chomp
      print "\nEnter Quantity: " 
      qty = gets.to_i
      @buy_price =[]
      price =File.open("product.txt", "r").each do |line|
        if File.open('product.txt').each_line.any?{|line| line.include?(name)}
          if line!=nil
            prod = eval(line)
            new_price=prod[:price]
            @buy_price << {price: new_price}
          end
        end 
      end 
    end
    @buy_product << {name: name, qty: qty}
    @buy_product= pp @buy_product.zip(@buy_price).collect { |array| array.inject(&:merge) }
    return @buy_product
  end

  def menu
    print "\nMenu\nEnter 1 for Admin\nEnter 2 for User\n3 for Exit\n"
  end
  
  def menu_admin
    print "\nMenu\nEnter 1 for Add Product\nEnter 2 for View Product\nEnter 3 for Search Product\nEnter 4 for Edit Product\nEnter 5 for Exit\n"
  end
  
  def menu_user
    print "\nMenu\nEnter 1 for Buy Product\nEnter 2 for View Product\n3 for Search Product\n4 for Exit\n"
  end
end

product_object=Product.new()
product_object.menu

begin
  print "\nEnter your choice: "
  ch=gets.to_i
  case ch
    when 1
      puts "Enter Your Email: "
      admin_email=gets.chomp
      print "Password: "
      admin_password=STDIN.noecho(&:gets).chomp
      if admin_email == "admin@gmail.com" && admin_password == "admin1234"
        product_object.menu_admin
        begin
          print "\nEnter your choice: "
          ch=gets.to_i
        case ch
          when 1
            puts "Add Product"
            print "Enter how many Products you want to enter: "
            num1=gets.to_i
            @product=product_object.inputs(num1)
            File.open("product.txt", "a+") do |f|
              @product.each { |element| f.puts(element) }
               # prod = eval(f)
               # @product.each do |element|
               #    if element[:name] == prod[:name]
               #      prod[:qty] += element[:qty]
               #      File.open("product.txt", "w+").each_line do |f|
               #        f.puts prod
               #      end
               #    else
               #       prod.each{|val| f.puts (val)}
               #    end
               #  end unless @product.nil?
              # name.each { |element| f.puts(element) }
              # qty.each { |element| f.puts(element) }
              # price.each { |element| f.puts(element) }

            end unless @product.nil?
          when 2
            puts "Product List\n"
            print "\tId\tName\t\tQty\t\tPrice\n"
            File.readlines("product.txt").each_with_index do |line|
              product_print = eval(line)
              print "\t",product_print[:id],"\t",product_print[:name],"\t\t",product_print[:qty],"\t\t",product_print[:price],"\t\n"
            end
            
          when 3
            puts "Search Product"
            puts "Enter Product Name you want to Search"
            word = gets.chomp
            if File.open('product.txt').each_line.any?{|line| line.include?(word)}
              print 'Product is Present'
            else
              print "Product is not Present"
            end

          when 4
            puts "Edit Product"
            print "Enter how many Products you want to edit: "
            num1=gets.to_i
            count = 0
            @product=product_object.inputs(num1)
              File.open("product.txt", "a+").each_line do |f|
               prod = eval(f)
               @product.each do |element|
                  if element[:id] == prod[:id]
                    # prod[:qty] += element[:qty]
                    # puts "+++++++++++++++++++++"
                    # puts element
                    # puts prod
                    # puts prod.replace(element) 
                    # puts "+++++++++++++++++++++"
                    new_prod = prod.replace(element)
                    new_prod.each do |k,v|
                      File.open("product.txt", 'a+') do |f|
                        f.puts new_prod
                        count+=1
                      end unless count == num1 ||@product==nil
                    end 
                    break
                  else
                    puts "Enter Valid Id Product with this ID is not present"
                    break
                  end
                end
            end unless @product==nil
            
          when 5
            puts "Exit from case"
            exit(0)
          else
            product_object.menu_admin()
          end
      end while ch != 5
      else
        product_object.menu
      end
      
    when 2
      puts "Enter Your Name: "
      user_name = gets.chomp
      print "Password: "
      user_password = STDIN.noecho(&:gets).chomp
      if user_name != nil && user_password != nil
        product_object.menu_user
        begin
          print "\nEnter your choice: "
          ch = gets.to_i
          case ch
            when 1
              puts "Buy product"
              print "Enter how many Products you want to enter: "
              num1 = gets.to_i
              total = 0
              @buy_product=product_object.buy_products(num1)
              File.open("buy_product.txt", "a+") do |f|
                @buy_product.each { |element| f.puts(element) }
              end 
              File.open("new_product.txt", File::TRUNC) {}
              puts "Buy Product List"
              print "\tName\t\tQty\t\tPrice\n"
              File.readlines("buy_product.txt").each_with_index do |line|
                buy_product_print = eval(line)
                print "\t", buy_product_print[:name],"\t\t",buy_product_print[:qty],"\t\t",buy_product_print[:price],"\t\n"
                total += buy_product_print[:price]
                print "\t\tTotal= ", total
                  File.open("product.txt", "a+").each_line do |f|
                    prod = eval(f)
                    File.open("new_product.txt", 'a+') do |f|
                      if File.open('product.txt').each_line.any?{|k| k.include?(buy_product_print[:name])}
                      new_prod = prod[:qty]-buy_product_print[:qty]
                      prod[:qty] = new_prod
                      f.puts prod
                      else
                        puts "Product is not Available"
                        break
                      end
                    end unless prod == nil
                  end 
              end unless @buy_product == nil
              source_file, destination_file = ARGV 
              script = $0
              # File.open("new_product.txt", File::TRUNC) {}
              input = File.open("new_product.txt")  
              data_to_copy = input.read()  # gather the data using read() method

              output = File.open("product.txt", 'w')
              output.write(data_to_copy)  # write up the data using write() method

              output.close()
              input.close()
            when 2
              puts "Product List\n"
              print "Name\t\tQty\tPrice\n"
            File.readlines("product.txt").each_with_index do |line|
              product_print = eval(line)
               print product_print[:name],"\t",product_print[:qty],"\t",product_print[:price],"\t\n"
            end
            
            when 3
              puts "search product"
              puts "Enter Product Name you want to Search"
              word = gets.chomp
              if File.open('product.txt').each_line.any?{|line| line.include?(word)}
                print 'Product is Present'
              else
                print "Product is not Present"
              end
            
            when 4
              puts "Exit from case"
              exit(0)

            else
              product_object.menu_user()
            end
          end while ch != 4
        else
          product_object.menu_user()
        end
    when 3
        puts "Exit from case"
        exit(0)
      else
        product_object.menu()
      end
    end while ch != 3