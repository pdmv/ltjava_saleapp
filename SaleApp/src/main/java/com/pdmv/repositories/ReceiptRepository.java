/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pdmv.repositories;

import com.pdmv.pojo.Cart;
import java.util.Map;

/**
 *
 * @author phamdominhvuong
 */
public interface ReceiptRepository {
    boolean addReceipt(Map<String, Cart> carts);
}
