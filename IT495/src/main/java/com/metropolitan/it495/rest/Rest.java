/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it495.rest;

import com.metropolitan.it495.dao.CRUDDao;
import com.metropolitan.it495.entity.Production;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
/**
 *
 * @author Milos
 */
@RestController
@RequestMapping(value = "/api")
public class Rest {
    @Autowired
    CRUDDao CrudDao;
    
    //metoda koja prikazuje production u JSON formatu
    @RequestMapping(value = "/production", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String,List<Production>>> getProduction() {
        Map<String, List<Production>> map = new HashMap<>();
        System.out.println("Fetching production");
        List<Production> production = CrudDao.getProduction();
        map.put("myArray", production);
        if (production.isEmpty()) {
            System.out.println("Production list empty");
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
}
