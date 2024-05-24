/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pdmv.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.pdmv.pojo.Cart;
import com.pdmv.pojo.Product;
import com.pdmv.repositories.ProductRepository;
import com.pdmv.services.ProductService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository proRepo;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Product> getProducts(Map<String, String> params) {
        return this.proRepo.getProducts(params);
    }

    @Override
    public void addOrUpdate(Product p) {
        if (p.getFile() != null && !p.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(p.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                p.setImage(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(ProductServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        this.proRepo.addOrUpdate(p);
    }


    @Override
    public Product getProductById(int id) {
        return this.proRepo.getProductById(id);
    }

    @Override
    public void deleteProduct(int id) {
        this.proRepo.deleteProduct(id);
    }

    @Override
    public boolean addReceipt(Map<String, Cart> cart) {
        if (cart != null)
            return this.proRepo.addReceipt(cart);
        return false;
    }
}
