/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pdmv.controllers;

import com.pdmv.pojo.Product;
import com.pdmv.services.ProductService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author phamdominhvuong
 */
@RestController
@RequestMapping("/api")
@CrossOrigin
public class ApiProductController {

    @Autowired
    private ProductService prodService;

    @GetMapping("/products")
    public ResponseEntity<List<Product>> list(@RequestParam Map params) {
        return new ResponseEntity<>(this.prodService.getProducts(params), HttpStatus.OK);
    }

    @GetMapping(path="/products/{productId}/", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> retrieve(@PathVariable(value = "productId") int id) {
        return new ResponseEntity<>(this.prodService.getProductById(id), HttpStatus.OK);
    }

    @DeleteMapping("/products/{productId}/")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void destroy(Model model, @PathVariable(value = "productId") int id) {
        this.prodService.deleteProduct(id);
    }
}
