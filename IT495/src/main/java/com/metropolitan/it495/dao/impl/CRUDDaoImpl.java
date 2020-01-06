/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it495.dao.impl;

import com.metropolitan.it495.dao.CRUDDao;
import com.metropolitan.it495.entity.Category;
import com.metropolitan.it495.entity.Customer;
import com.metropolitan.it495.entity.Machine;
import com.metropolitan.it495.entity.Orders;
import com.metropolitan.it495.entity.Product;
import com.metropolitan.it495.entity.Production;
import com.metropolitan.it495.entity.Users;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Milos
 */
@Repository("crudDao")
@Service
public class CRUDDaoImpl implements CRUDDao{
    
    // instanciranje sesije
    @Autowired
    private SessionFactory sessionFactory;

    // kreiranje setera
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    // kreiranje getera

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Transactional
    @Override
    public Users findUserByUsername(String username) {
        Users user = (Users) getSession().createCriteria(Users.class).add(Restrictions.eq("username", username)).uniqueResult();
        return user;
    }

    @Transactional
    @Override
    public Users addUser(Users user) {
        return (Users) getSession().merge(user);
    }

    @Transactional
    @Override
    public void deleteUser(Users user) {
        getSession().delete(user);
    }

    @Override
    @Transactional
    public void editUser(Users user) {
        getSession().saveOrUpdate(user);
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional
    public List<Users> getUsers() {
        List<Users> results = (List<Users>) getSession().createCriteria(Users.class).list();
        return results;
    }
    
    @Override
    @Transactional
    public Users getUserById(int userId) {
        Users users = (Users) getSession().createCriteria(Users.class).add(Restrictions.eq("userId", userId)).uniqueResult();
        return users;
    }
    
    @Override
    @Transactional
    public List<Customer> getCustomers() {
        List<Customer> results = (List<Customer>) getSession().createCriteria(Customer.class).list();
        return results;
    }

    @Override
    @Transactional
    public Customer getCustomerById(int id) {
        Customer customer = (Customer) getSession().createCriteria(Customer.class).add(Restrictions.eq("customerId", id)).uniqueResult();
        return customer;
    }
    
    @Override
    @Transactional
    public void editCustomer(Customer customer) {
        getSession().saveOrUpdate(customer);
    }
    
    @Override
    @Transactional
    public Customer addCustomer(Customer customer) {
        return (Customer) getSession().merge(customer);
    }
    
    @Transactional
    @Override
    public void deleteCustomer(Customer customer) {
        getSession().delete(customer);
    }
    
    @Override
    @Transactional
    public List<Category> getCategory() {
        List<Category> results = (List<Category>) getSession().createCriteria(Category.class).list();
        return results;
    }

    @Override
    @Transactional
    public Category getCategoryById(int id) {
        Category category = (Category) getSession().createCriteria(Category.class).add(Restrictions.eq("categoryId", id)).uniqueResult();
        return category;
    }
    
    @Override
    @Transactional
    public void editCategory(Category category) {
        getSession().saveOrUpdate(category);
    }
    
    @Override
    @Transactional
    public Category addCategory(Category category) {
        return (Category) getSession().merge(category);
    }
    
    @Transactional
    @Override
    public void deleteCategory(Category category) {
        getSession().delete(category);
    }
    
    @Override
    @Transactional
    public List<Product> getProduct() {
        List<Product> results = (List<Product>) getSession().createCriteria(Product.class).list();
        return results;
    }

    @Override
    @Transactional
    public Product getProductById(int id) {
        Product product = (Product) getSession().createCriteria(Product.class).add(Restrictions.eq("productId", id)).uniqueResult();
        return product;
    }
    
    @Override
    @Transactional
    public void editProduct(Product product) {
        getSession().saveOrUpdate(product);
    }
    
    @Override
    @Transactional
    public Product addProduct(Product product) {
        return (Product) getSession().merge(product);
    }
    
    @Transactional
    @Override
    public void deleteProduct(Product product) {
        getSession().delete(product);
    }
    
    @Override
    @Transactional
    public Orders addOrder(Orders orders) {
        return (Orders) getSession().merge(orders);
    }
    
    @Override
    @Transactional
    public List<Orders> getOrders() {
        List<Orders> results = (List<Orders>) getSession().createCriteria(Orders.class).list();
        return results;
    }

    @Override
    @Transactional
    public Orders getOrdersById(int id) {
        Orders orders = (Orders) getSession().createCriteria(Orders.class).add(Restrictions.eq("orderId", id)).uniqueResult();
        return orders;
    }
    
    @Override
    @Transactional
    public void editOrders(Orders orders) {
        getSession().saveOrUpdate(orders);
    }
    
    @Transactional
    @Override
    public void deleteOrders(Orders orders) {
        getSession().delete(orders);
    }
    
    @Override
    @Transactional
    public List<Machine> getMachine() {
        List<Machine> results = (List<Machine>) getSession().createCriteria(Machine.class).list();
        return results;
    }

    @Override
    @Transactional
    public Machine getMachineById(int id) {
        Machine machine = (Machine) getSession().createCriteria(Machine.class).add(Restrictions.eq("machineId", id)).uniqueResult();
        return machine;
    }
    
    @Override
    @Transactional
    public void editMachine(Machine machine) {
        getSession().saveOrUpdate(machine);
    }
    
    @Override
    @Transactional
    public Machine addMachine(Machine machine) {
        return (Machine) getSession().merge(machine);
    }
    
    @Transactional
    @Override
    public void deleteMachine(Machine machine) {
        getSession().delete(machine);
    }
    
    @Override
    @Transactional
    public List<Production> getProduction() {
        List<Production> results = (List<Production>) getSession().createCriteria(Production.class).list();
        return results;
    }

    @Override
    @Transactional
    public Production getProductionById(int id) {
        Production production = (Production) getSession().createCriteria(Production.class).add(Restrictions.eq("productionId", id)).uniqueResult();
        return production;
    }
    
    @Override
    @Transactional
    public void editProduction(Production production) {
        getSession().saveOrUpdate(production);
    }
    
    @Override
    @Transactional
    public Production addProduction(Production production) {
        return (Production) getSession().merge(production);
    }
    
    @Transactional
    @Override
    public void deleteProduction(Production production) {
        getSession().delete(production);
    }
    
    @Transactional
    @Override
    public List<Production> getProductionByUser(Users u) {
        List<Production> p = (List<Production>) getSession().createCriteria(Production.class).add(Restrictions.eq("user", u)).list();
        return p;
    }
    
    @Override
    @Transactional
    public List<Production> getInProductionByStatus(String prodStatus) {
        List<Production> production = (List<Production>) getSession().createCriteria(Production.class).add(Restrictions.eq("prodStatus", prodStatus)).list();
        return production;
    }
}
