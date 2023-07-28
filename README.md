# Generasi GIGIH - Backend Engineering Track Final Project

Generasi GIGIH is a 4-month bootcamp program held by YABB (Yayasan Anak Bangsa Bisa) by Gojek & Tokopedia. There are other tracks such as data analysis and frontend engineer. This is my final project for BE track. Main tech stack for this project is **Ruby on Rails**.

Time given to finish: 10 days.

## Preview

![image](https://github.com/khelli07/GenerasiGigih-BE-Final-Project/assets/71018093/ba4a1500-d886-4ac3-a458-c40942bdf1d0)

![image](https://github.com/khelli07/GenerasiGigih-BE-Final-Project/assets/71018093/2c38ecdb-7a29-4702-8a8c-f74ba1561987)

![image](https://github.com/khelli07/GenerasiGigih-BE-Final-Project/assets/71018093/d69a6c8b-196e-423a-8daf-7b785beb41e8)

![image](https://github.com/khelli07/GenerasiGigih-BE-Final-Project/assets/71018093/7a9f2208-febb-4708-9678-4cc7b39324e6)

## Table of Contents
- [ Requirements ](#Requirements)
- [ Project Problem Statement ](#Project-Problem-Statement)
- [ User Story Mapping ](#User-Story-Mapping)
- [ What Could be Improved ](#What-Could-be-Improved)
- [ List of All Endpoints ](#List-of-All-Endpoints)
- [ Acknowledgement ](#Acknowledgement)

## Requirements
1. Ruby v3.0.3
2. Rails v7.0.1
3. ... refer to Gemfile for other requirements

## Project Problem Statement

Pak Gagah and Bu Guguh are Gigih's parents. They run a catering business for many years and record their business data in a book. As a good child, Gigih wants to help his parents in running their business. Therefore, Gigih plans to create an application to help record his parents' catering business data.

The business process of Gigih's parents is as follows: every morning, Pak Gagah and Bu Guguh will announce the food menu and prices to the catering WhatsApp group. Customers will usually order through WhatsApp groups and make payments via bank transfer. If the customer has not paid for the order by 5 pm, the customer is considered cancelling their order. 

After 5 pm, Pak Gagah and Bu Guguh will see a list of orders that have been paid and will prepare a menu of food to be sent according to the order. In addition, every day, Pak Gagah and Bu Gigih will also see how much their total income was that day.

Gigih works as a project manager at a company called The Eco Mews. Even though he could create user stories, Gigih couldn't create the apps he wanted on his own. Therefore, Gigih made the following specifications for you so that you can help him build the following API-based applications.


## User Story Mapping

1. As an owner, I want to create a new menu item. So that I can show them to my customers later <br>
    **Status**: done <br>
    **Bonus implemented?**: yes. <br>
    **Endpoint**: "/food/new" (get method) <br>
    **Side notes**:
    - Owner should make categories through "/category/new" first before creating food. All list of categories can be viewed from "/category".

2. As an owner, I want to update an existing menu item. So that I can modify info related to the menu item <br>
    **Status**: done <br>
    **Endpoint**: "/food/:id" (get method; recommended to click from "show" button from "/food". Otherwise, the menu may not be found).

3. As an owner, I want to show the list of all menu items. So that my customers can see the list of all menu items that I sell. <br>
    **Status**: done <br>
    **Endpoint**: "/food" (get method, show all)

4. As an owner, I want to delete an existing menu item So that I can remove a menu item that is no longer provided by my catering service. <br>
    **Status**: done <br>
    **Endpoint**: "/food/:id/delete" (post method, should be clicked from "/food")

5. As an owner, I want to add customer's order. So that I can prepare their order. <br>
    **Status**: done <br>
    **Endpoint**: "order/new" (get method) <br>
    **Side notes**:
    - Owner should make an order first, then add order details by clicking "Atur" on order index page.
    - If email is not valid, app will return 400 status code and customer will not be created.
    - Customers from order new page are guaranteed to be available (I use dropdown).
    - One order can have many order details. Hence, different kind of foods is possible.
    - In order detail, I put attribute "qty" as quantity. I also put "food_price" as it can not be retrieved from Food table (when food table is updated, food_price should maintain its price. Hence, separated attribute).
    - To see daily report, use search bar. Total earning will be summed from orders that have been paid.


6. As an owner, I want to update a customer's order. So that I can modify info related to the order. <br>
    **Status**: done <br>
    **Endpoint**: "order/:id/edit" (get method) <br>
    **Bonus implemented?**: yes. The cancelation will be automated. <br>

7. As an owner, I want to see a daily report of orders. So that I can see the revenue that I have generated for that day. <br>
    **Status**: done <br>
    **Endpoint**: "order/new" (get method) <br>
    **Bonus implemented?**: yes. Search bar are available for search by dates and search by email (not required to be exact email, substring is possible). 

## What Could be Improved

Here are some thing that I am having difficulties when implementing, but if implemented, the code might be cleaner and more effective.

1. Adding nested form to fill order (and order details).
2. Adding food categories automatically when passed using indexing and join table. 
3. From point 2, Having validated whether or not the food has categories (food should at least have one category) inside the food itself. Not managed by controller (my current implementation).
4. Custom error page.

## List of All Endpoints

- "/" (GET) landing page
- "/food" (GET) food index page
- "/food/:id" (GET) food show page
- "/food/:id/edit" (GET) food edit page
- "/food/new" (GET) new food page
- "/food/:id/delete" (POST) food delete
- "/food" (POST) create new food
- "/food/:id" (PATCH) update food

All other pages: just change "food" to "category", "customer", or "order". For order details, the pages are:

- "/order/:order_id/order_detail/:order_detail_id/edit" (GET) order detail edit page
- "/order/:order_id/order_detail/:order_detail_id/new" (GET) order detail new page
- "/order/:order_id/order_detail" (POST) create order detail 
- "/order/:order_id/order_detail/:id" (PATCH) update order detail 
- "/order/:order_id/order_detail/:order_detail_id/delete" (POST) delete order detail

To see all details in an order, just visit "/order/:order_id" (GET).

## Acknowledgement

I would like to thank my class instructors: Rahul Goel, Fauzi Fadhlurrohman, Zahrah Ayu Afifah Febriani, Abhishek Patel, Saptanto Sindu Kuncoro Utomo, and the one and only Iqbal Farabi (a.k.a Insinyur Online)!

<hr>
Made with 💖 by Maria Khelli 
