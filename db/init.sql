{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset0 Menlo-Bold;}
{\colortbl;\red255\green255\blue255;\red64\green11\blue217;\red0\green0\blue0;\red159\green160\blue28;
\red47\green180\blue29;}
{\*\expandedcolortbl;;\cssrgb\c32309\c18666\c88229;\csgray\c0;\cssrgb\c68469\c68012\c14211;
\cssrgb\c20241\c73898\c14950;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx1120\tx1680\tx2240\tx2800\tx3286\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \CocoaLigature0 DROP\cf3  \cf2 DATABASE\cf3  
\f1\b \cf4 IF
\f0\b0 \cf3  EXISTS 
\f1\b \cf2 `epam_project_db`
\f0\b0 \cf3 ;\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0
\
\cf2 CREATE\cf3  \cf2 DATABASE\cf3  
\f1\b \cf2 `epam_project_db`
\f0\b0 \cf3  \cf2 DEFAULT\cf3  CHARACTER \cf2 SET\cf3  utf8;\
\
USE 
\f1\b \cf2 `epam_project_db`
\f0\b0 \cf3 ;\
\
\cf2 CREATE\cf3  \cf2 TABLE\cf3  
\f1\b \cf2 `roles`
\f0\b0 \cf3 (
\f1\b \cf2 `id`
\f0\b0 \cf3  ENUM(\cf5 'cashier'\cf3 , \cf5 'senior cashier'\cf3 , \cf5 'commodity expert'\cf3 ) NOT NULL);\
\cf2 ALTER\cf3  \cf2 TABLE\cf3 \
    
\f1\b \cf2 `roles`
\f0\b0 \cf3  ADD PRIMARY KEY 
\f1\b \cf2 `roles_id_primary`
\f0\b0 \cf3 (
\f1\b \cf2 `id`
\f0\b0 \cf3 );\
\cf2 CREATE\cf3  \cf2 TABLE\cf3  
\f1\b \cf2 `users`
\f0\b0 \cf3 (\
    
\f1\b \cf2 `id`
\f0\b0 \cf3  INT UNSIGNED NOT NULL AUTO_INCREMENT,\
    
\f1\b \cf2 `role_id`
\f0\b0 \cf3  ENUM(\cf5 'cashier'\cf3 ,\cf5 'senior cashier'\cf3 ,\cf5 'comodity expert'\cf3 ) NOT NULL,\
    
\f1\b \cf2 `name`
\f0\b0 \cf3  VARCHAR(255) UNIQUE NOT NULL,\
    
\f1\b \cf2 `pass_hash`
\f0\b0 \cf3  VARCHAR(255) NOT NULL,\
        PRIMARY KEY(id)\
);\
\
\cf2 CREATE\cf3  \cf2 TABLE\cf3  
\f1\b \cf2 `goods`
\f0\b0 \cf3 (\
    
\f1\b \cf2 `id`
\f0\b0 \cf3  INT UNSIGNED NOT NULL AUTO_INCREMENT,\
    
\f1\b \cf2 `name`
\f0\b0 \cf3  VARCHAR(255) NOT NULL,\
    
\f1\b \cf2 `description`
\f0\b0 \cf3  VARCHAR(255) NULL,\
    
\f1\b \cf2 `price`
\f0\b0 \cf3  INT NOT NULL,\
        PRIMARY KEY(id)\
);\
\
\cf2 CREATE\cf3  \cf2 TABLE\cf3  
\f1\b \cf2 `warehouse`
\f0\b0 \cf3 (\
    
\f1\b \cf2 `product_id`
\f0\b0 \cf3  INT UNSIGNED UNIQUE NOT NULL,\
    
\f1\b \cf2 `quantity`
\f0\b0 \cf3  INT NOT NULL\
);\
\
\cf2 CREATE\cf3  \cf2 TABLE\cf3  
\f1\b \cf2 `orders`
\f0\b0 \cf3 (\
    
\f1\b \cf2 `id`
\f0\b0 \cf3  INT UNSIGNED NOT NULL AUTO_INCREMENT,\
    
\f1\b \cf2 `date`
\f0\b0 \cf3  DATETIME NOT NULL,\
    
\f1\b \cf2 `created_by`
\f0\b0 \cf3  INT UNSIGNED NOT NULL,\
        PRIMARY KEY(id)\
);\
\
\cf2 CREATE\cf3  \cf2 TABLE\cf3  
\f1\b \cf2 `order_items`
\f0\b0 \cf3 (\
    
\f1\b \cf2 `order_id`
\f0\b0 \cf3  INT UNSIGNED NOT NULL,\
    
\f1\b \cf2 `product_id`
\f0\b0 \cf3  INT UNSIGNED NOT NULL,\
    
\f1\b \cf2 `product_name`
\f0\b0 \cf3  VARCHAR(255) NOT NULL,\
    
\f1\b \cf2 `quantity`
\f0\b0 \cf3  INT NOT NULL\
);\
\cf2 ALTER\cf3  \cf2 TABLE\cf3 \
    
\f1\b \cf2 `users`
\f0\b0 \cf3  ADD CONSTRAINT 
\f1\b \cf2 `users_role_id_foreign`
\f0\b0 \cf3  \cf2 FOREIGN\cf3  KEY(
\f1\b \cf2 `role_id`
\f0\b0 \cf3 ) REFERENCES 
\f1\b \cf2 `roles`
\f0\b0 \cf3 (
\f1\b \cf2 `id`
\f0\b0 \cf3 );\
\cf2 ALTER\cf3  \cf2 TABLE\cf3 \
    
\f1\b \cf2 `warehouse`
\f0\b0 \cf3  ADD CONSTRAINT 
\f1\b \cf2 `warehouse_product_id_foreign`
\f0\b0 \cf3  \cf2 FOREIGN\cf3  KEY(
\f1\b \cf2 `product_id`
\f0\b0 \cf3 ) REFERENCES 
\f1\b \cf2 `goods`
\f0\b0 \cf3 (
\f1\b \cf2 `id`
\f0\b0 \cf3 );\
\cf2 ALTER\cf3  \cf2 TABLE\cf3 \
    
\f1\b \cf2 `orders`
\f0\b0 \cf3  ADD CONSTRAINT 
\f1\b \cf2 `orders_created_by_foreign`
\f0\b0 \cf3  \cf2 FOREIGN\cf3  KEY(
\f1\b \cf2 `created_by`
\f0\b0 \cf3 ) REFERENCES 
\f1\b \cf2 `users`
\f0\b0 \cf3 (
\f1\b \cf2 `id`
\f0\b0 \cf3 );\
\cf2 ALTER\cf3  \cf2 TABLE\cf3 \
    
\f1\b \cf2 `order_items`
\f0\b0 \cf3  ADD CONSTRAINT 
\f1\b \cf2 `order_items_order_id_foreign`
\f0\b0 \cf3  \cf2 FOREIGN\cf3  KEY(
\f1\b \cf2 `order_id`
\f0\b0 \cf3 ) REFERENCES 
\f1\b \cf2 `orders`
\f0\b0 \cf3 (
\f1\b \cf2 `id`
\f0\b0 \cf3 );\
\cf2 ALTER\cf3  \cf2 TABLE\cf3 \
    
\f1\b \cf2 `order_items`
\f0\b0 \cf3  ADD CONSTRAINT 
\f1\b \cf2 `order_items_product_id_foreign`
\f0\b0 \cf3  \cf2 FOREIGN\cf3  KEY(
\f1\b \cf2 `product_id`
\f0\b0 \cf3 ) REFERENCES 
\f1\b \cf2 `goods`
\f0\b0 \cf3 (
\f1\b \cf2 `id`
\f0\b0 \cf3 );\
\cf2 ALTER\cf3  \cf2 TABLE\cf3 \
        
\f1\b \cf2 `users`
\f0\b0 \cf3  ADD CONSTRAINT 
\f1\b \cf2 `unique_role_for_user`
\f0\b0 \cf3  UNIQUE(name,role_id);\
\
}