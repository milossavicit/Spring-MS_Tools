/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it495.converter;

import com.metropolitan.it495.dao.CRUDDao;
import com.metropolitan.it495.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

/**
 *
 * @author Milos
 */
public class IntegerToCategory implements Converter<String, Category> {
    @Autowired
    CRUDDao crudDao;

    @Override
    public Category convert(String s) {
        if (s.isEmpty()) {
            return null;
        }
        Integer value = Integer.valueOf(s);
        System.out.println("Konvertujem u category");
        Category c = crudDao.getCategoryById(value);
        return c;
    }
}
