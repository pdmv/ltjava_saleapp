/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pdmv.repositories.impl;

import com.pdmv.pojo.Cart;
import com.pdmv.pojo.OrderDetail;
import com.pdmv.pojo.SaleOrder;
import com.pdmv.pojo.User;
import com.pdmv.repositories.ProductRepository;
import com.pdmv.repositories.ReceiptRepository;
import com.pdmv.repositories.UserRepository;
import java.util.Date;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author phamdominhvuong
 */
@Repository
public class ReceiptRepositoryImpl implements ReceiptRepository {

    @Autowired
    private UserRepository userRepo;
    @Autowired
    private ProductRepository productRepo;
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addReceipt(Map<String, Cart> carts) {

        Session s = this.factory.getObject().getCurrentSession();
        SaleOrder order = new SaleOrder();

        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User u = this.userRepo.getUserByUsername(authentication.getName());
            order.setUserId(u);
            order.setCreatedDate(new Date());
            s.save(u);

            for (Cart c : carts.values()) {
                OrderDetail d = new OrderDetail();
                d.setProductId(this.productRepo.getProductById(c.getId()));
                d.setOrderId(order);
                d.setQuantity(c.getQuantity());
                d.setUnitPrice(c.getPrice());

                s.save(d);
            }

            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }

    }
}
