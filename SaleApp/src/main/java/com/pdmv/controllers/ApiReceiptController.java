/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pdmv.controllers;

import com.pdmv.pojo.Cart;
import com.pdmv.services.ReceiptService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author phamdominhvuong
 */
@RestController
@RequestMapping("/api")
public class ApiReceiptController {
    @Autowired
    private ReceiptService receiptService;
    
    @PostMapping("/pay/")
    @ResponseStatus(HttpStatus.OK)
    @CrossOrigin
    public void add(@RequestBody Map<String, Cart> carts) {
        this.receiptService.addReceipt(carts);
    }
}
