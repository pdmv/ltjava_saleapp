/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.pdmv.hibernatedemo;

import com.pdmv.pojo.Product;
import com.pdmv.repository.impl.CategoryRepositoryImpl;
import com.pdmv.repository.impl.ProductRepositoryImpl;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author admin
 */
public class HibernateDemo {

    public static void main(String[] args) {
        CategoryRepositoryImpl s = new CategoryRepositoryImpl();
        
        s.getCategories().forEach(c -> System.out.println(c.getName()));
//        try (Session s = HibernateUtils.getFactory().openSession()) {
//            Query q = s.createQuery("From Category");
//            List<Category> cates = q.getResultList();
//            
//            cates.forEach(c -> System.out.println(c.getName()));
//        }
        ProductRepositoryImpl p = new ProductRepositoryImpl();
        
        Product prod = new Product();
        prod.setName("iPhone XYz");
        prod.setPrice(18000000);
        prod.setCategoryId(s.getCategoryById(1));
        
        p.addOrUpdate(prod);
//        
//        Map<String, String> params = new HashMap<>();
//        params.put("fromPrice", "18000000");
//        params.put("toPrice", "21000000");
//        params.put("cateId", "1");
////        params.put("fromPrice", "18000000");
//        
//        
//        p.getProducts(params)
//                .forEach(prod -> System.out.printf("%d - %s - %.1f - %s\n", 
//                    prod.getId(), prod.getName(), prod.getPrice(),
//                    prod.getCategoryId().getName()));
    }
}
