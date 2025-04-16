<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sakura E-Commerce</title>
    <link rel="stylesheet" href="CSSfiles/StyleMain.css">
</head>
<body>
	 
    <!-- Header -->
    
    <header>
        <h1>Sakura E-Commerce  </h1>
    </header>
  <!-- Menu Bar -->
	<%
	//retrive the session Object
	HttpSession session1 = request.getSession(false);
	
	//check if the session is not null nad also Username is Notnull
	if (session1 != null && session1.getAttribute("Username") != null){
		String username = (String) session1.getAttribute("Username");
		
	%>
	<nav>
        <ul class="menu">
            <li><a href="MainPage.jsp">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">Welcome <%= username.toUpperCase() %></a></li>
            <li><div class="content" >
           		 <form action="view-cart" method="get">
            		<button >View Cart</button>
            	 </form>
            	</div></li>            
            <li>
            	<div class="content" >
           		 <form action="LogoutServlet" method="get">
            		<button >Logout</button>
            	 </form>
            	</div>
            </li> 
        </ul>
    </nav>
       <% 
		   } else{
			   //redirect to login page
			response.sendRedirect("login.jsp");
		  }
		%>
	

    <!-- Main Content -->
    <main>
        <!-- Section: Smartphones -->
        <section>
            <h2>Smartphones</h2>
            <div class="product-grid">
                <div class="product">
                    <img src="images/SmartPhones/Samsung_Galaxy_S23_Utra_5G.jpg" alt="Samsung Galaxy S23 Ultra 5G">
                    <p>Samsung Galaxy S23 Ultra 5G</p>
                    <p>Rs.71,999</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="1">
                    <button>View Details</button> 
                    </form>
                    </div>
                </div>
                
                <div class="product">
                    <img src="images/SmartPhones/Apple_iPhone_15.jpg" alt="Apple iPhone 15">
                    <p>Apple iPhone 15</p>
                    <p>Rs.89,999</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="2">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/SmartPhones/iQOO_Z9s_5G.jpg" alt="iQOO Z9s 5G">
                    <p>iQOO Z9s 5G</p>
                    <p>Rs.39,999</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="3">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/SmartPhones/OnePlus_13R.jpg" alt="OnePlus 13R">
                    <p>OnePlus 13R</p>
                    <p>Rs.51,999</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="4">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
            </div>
        </section>

        <!-- Section: Household Electronic Appliances -->
        <section>
            <h2>Household Electronic Appliances</h2>
            <div class="product-grid">
                <div class="product">
                    <img src="images/ElectronicAppliances/Acer_139_cm_(55_inches)_I_Pro_Series_4K_Ultra_HD_LED_Smart_Google_TV_AR55UDIGU2875AT_(Black).jpg" alt="Acer 139 cm (55 inches) I Pro Series 4K Ultra HD LED Smart Google TV AR55UDIGU2875AT (Black)">
                    <p>Acer 139 cm (55 inches) I Pro Series 4K Ultra HD LED Smart Google TV AR55UDIGU2875AT (Black)</p>
                    <p>Rs.40,000</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="5">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/ElectronicAppliances/Samsung_163_cm_(65_inches)_D_Series_Crystal_4K_Vivid_Ultra_HD_Smart_LED_TV_UA65DUE70BKLXL_(Black).jpg" alt="Samsung 163 cm (65 inches) D Series Crystal 4K Vivid Ultra HD Smart LED TV UA65DUE70BKLXL (Black)">
                    <p>Samsung 163 cm (65 inches) D Series Crystal 4K Vivid Ultra HD Smart LED TV UA65DUE70BKLXL (Black)</p>
                    <p>Rs.51,999</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="6">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/ElectronicAppliances/Sony_Bravia_2_4K_Ultra_HD_Smart_Google_TV_2024_Edition.jpg" alt="Sony Bravia 2 4K Ultra HD Smart Google TV 2024 Edition">
                    <p>Sony Bravia 2 4K Ultra HD Smart Google TV 2024 Edition</p>
                    <p>Rs.76,000</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="7">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/ElectronicAppliances/Xiaomi_138_cm_(55_inches)_X_Pro_4K_Dolby_Vision_IQ_Series_Smart_Google_TV_L55M8-5XIN_(Black).jpg" alt="Xiaomi 138 cm (55 inches) X Pro 4K Dolby Vision IQ Series Smart Google TV L55M8-5XIN (Black)">
                    <p>Xiaomi 138 cm (55 inches) X Pro 4K Dolby Vision IQ Series Smart Google TV L55M8-5XIN (Black)</p>
                    <p>Rs.40,000</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="8">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
            </div>
        </section>

        <!-- Other Sections -->
        <section>
            <h2>Grocery</h2>
            <div class="product-grid">
                <div class="product">
                    <img src="images/Grocery/Fortune_Sunlite_Refined_Sunflower_Oil_1L.jpg" alt="Fortune Sunlite Refined Sunflower Oil, 1L">
                    <p>Fortune Sunlite Refined Sunflower Oil, 1L</p>
                    <p>Rs.139</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="9">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/Grocery/India_Gate_Basmati_Rice_Everyday_5kg.jpg" alt="India Gate Basmati Rice Everyday 5kg">
                    <p>India Gate Basmati Rice Everyday 5kg</p>
                    <p>Rs.599</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="10">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/Grocery/Tata_Sampann_Unpolished_Toor_Dal.Arhar_Dal_1kg.jpg" alt="Tata Sampann Unpolished Toor Dal.Arhar Dal, 1kg">
                    <p>Tata Sampann Unpolished Toor Dal.Arhar Dal, 1kg</p>
                    <p>Rs.178</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="11">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/Grocery/Del_Monte_Tomato_Ketchup-Classic_Blend_900_grams.jpg" alt="Del Monte Tomato Ketchup - Classic Blend, 900 grams.jpg">
                    <p>Del Monte Tomato Ketchup - Classic Blend, 900 grams</p>
                    <p>Rs.110</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="12">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                <!-- Add more products as needed -->
            </div>
        </section>
        <section>
            <h2>Clothes</h2>
            <div class="product-grid">
                <div class="product">
                    <img src="images/Clothes/BULLMER_Trendy_Regular_Fit_Printed_Causal_Shirt_for_Men-Pack_of_1.jpg" alt="BULLMER Trendy Regular Fit Printed Causal Shirt for Men - Pack of 1">
                    <p>BULLMER Trendy Regular Fit Printed Causal Shirt for Men - Pack of 1</p>
                    <p>Rs.4850</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="13">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/Clothes/Istyle_Can_Plain_Round_Neck_Rib_Knit_Regular_Top_for_Women.jpg" alt="Istyle Can Plain Round Neck Rib Knit Regular Top for Women">
                    <p>Istyle Can Plain Round Neck Rib Knit Regular Top for Women</p>
                    <p>Rs.1025</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="14">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/Clothes/IndoPrimo_Men's_Stylish_Solid_Satin_Casual_Shirt_for_Men_Full_Sleeve.jpg" alt="IndoPrimo Men's Stylish Solid Satin Casual Shirt for Men Full Sleeve">
                    <p>IndoPrimo Men's Stylish Solid Satin Casual Shirt for Men Full Sleeve</p>
                    <p>Rs.7845</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="15">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/Clothes/Leriya_Fashion_Western_Dress_Summer_Short_Dresses_for_Women.jpg" alt="Leriya Fashion Western Dress, Summer Short Dresses for Women.">
                    <p>Leriya Fashion Western Dress, Summer Short Dresses for Women.</p>
                    <p>Rs.2000</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="16">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
            </div>
        </section>
        <section>
            <h2>Laptops and Computers</h2>
            <div class="product-grid">
                <div class="product">
                    <img src="images/L&C/ASUS_TUF_Gaming_F15_15.6_(39.62cm)_FHD_144Hz_13th_Gen_Intel_Core_i7-13620H_Gaming_Laptop.jpg" alt="ASUS TUF Gaming F15, 15.6 (39.62cm) FHD 144Hz, 13th Gen Intel Core i7-13620H, Gaming Laptop">
                    <p>ASUS TUF Gaming F15, 15.6 (39.62cm) FHD 144Hz, 13th Gen Intel Core i7-13620H, Gaming Laptop</p>
                    <p>Rs.51,000</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="17">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/L&C/Lenovo_V14_G3_Intel_Core_i5_12th_Gen_1235U.jpg" alt="Lenovo V14 G3">
                    <p>Lenovo V14 G3 IAP Laptop 12th Generation Intel® Core™ i5-1235U Processor(Core™ i5-1235U)/ 8GB DDR4 / 512 GB SSD PCIe / 14.0 FHD TN Display/Windows 11 / Silver (Grey) / 1 Year Onsite Warranty</p>
                    <p>Rs.37,000</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="18">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/L&C/Canon_PowerShot_V10_Camera.jpg" alt="Canon PowerShot V10 Camera">
                    <p>Canon PowerShot V10 13.1 MP Digital Camera with CMOS Sensor|13.1MP | 4K Vlogging Camera - Black</p>
                    <p>Rs.38,656</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="19">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <div class="product">
                    <img src="images/L&C/Dell_Vostro_15_3530_Laptop–15.6_inch_FHD_(35.56cm)_Display_13th_Gen_Intel_Core_i5-1334U_Processor_8_GB_RAM.jpg" alt="Dell Vostro 15 3530">
                    <p>Dell Vostro 15 3530 Laptop – 15.6 inch FHD (35.56cm) Display, 13th Gen Intel Core i5-1334U Processor, 8 GB RAM</p>
                    <p>Rs.60,000</p>
                    <div class="content" >
                    <form action="ProductDetails" method="post">
                    <input type="hidden" name = "viewDetails" value="20">
                    <button>View Details</button> 
                    </form>
                     </div>
                </div>
                
                <!-- Add more products as needed -->
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>Contact: support@sakura-ecommerce.com | Copyright © 2025 Sakura E-Commerce</p>
    </footer>
    
</body>
</html>
