/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it495.converter;

import com.metropolitan.it495.dao.CRUDDao;
import com.metropolitan.it495.entity.Machine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

/**
 *
 * @author Milos
 */
public class IntegerToMachine implements Converter<String, Machine> {
    @Autowired
    CRUDDao crudDao;

    @Override
    public Machine convert(String s) {
        if (s.isEmpty()) {
            return null;
        }
        Integer value = Integer.valueOf(s);
        System.out.println("Konvertujem u machine.");
        Machine m = crudDao.getMachineById(value);
        return m;
    }
}
