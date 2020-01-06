/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it495.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Milos
 */
@Entity
@Table(name = "production")
public class Production {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "productionId")
    private Integer productionId;

    @Column(name = "prodStatus")
    private String prodStatus;
    
    @JoinColumn(name = "machineId", referencedColumnName = "machineId")
    @ManyToOne(optional = false)
    private Machine machineId;
    
    @JoinColumn(name = "productId", referencedColumnName = "productId")
    @ManyToOne(optional = false)
    private Product productId;
    
    @JoinColumn(name = "user", referencedColumnName = "username")
    @ManyToOne(optional = false)
    private Users user;

    public Integer getProductionId() {
        return productionId;
    }

    public void setProductionId(Integer productionId) {
        this.productionId = productionId;
    }

    public String getProdStatus() {
        return prodStatus;
    }

    public void setProdStatus(String prodStatus) {
        this.prodStatus = prodStatus;
    }

    public Machine getMachineId() {
        return machineId;
    }

    public void setMachineId(Machine machineId) {
        this.machineId = machineId;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Production{" + "productionId=" + productionId + ", prodStatus=" + prodStatus + ", machineId=" + machineId + ", productId=" + productId + ", user=" + user + '}';
    }
}
