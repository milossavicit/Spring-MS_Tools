/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it495.converter;

import com.metropolitan.it495.dao.CRUDDao;
import com.metropolitan.it495.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

/**
 *
 * @author Milos
 */
public class IntegerToProduct implements Converter<String, Product> {
    @Autowired
    CRUDDao crudDao;

    @Override
    public Product convert(String s) {
        if (s.isEmpty()) {
            return null;
        }
        Integer value = Integer.valueOf(s);
        System.out.println("Konvertujem u product.");
        Product p = crudDao.getProductById(value);
        return p;
    }
}
