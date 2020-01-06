/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it495.dao;

import com.metropolitan.it495.entity.Category;
import com.metropolitan.it495.entity.Customer;
import com.metropolitan.it495.entity.Machine;
import com.metropolitan.it495.entity.Orders;
import com.metropolitan.it495.entity.Product;
import com.metropolitan.it495.entity.Production;
import com.metropolitan.it495.entity.Users;
import java.util.List;

/**
 *
 * @author Milos
 */
public interface CRUDDao {

    public Users findUserByUsername(String username);
    
    public Users addUser(Users user);
    
    public void deleteUser(Users user);
    
    public void editUser(Users user);

    public Object getUsers();
    
    public Users getUserById(int userId);
    
    public List<Customer> getCustomers();

    public Customer getCustomerById(int id);
    
    public void editCustomer(Customer customer);

    public Customer addCustomer(Customer customer);
    
    public void deleteCustomer(Customer customer);
    
    public List<Category> getCategory();

    public Category getCategoryById(int id);
    
    public void editCategory(Category category);

    public Category addCategory(Category category);
    
    public void deleteCategory(Category category);
    
    public List<Product> getProduct();

    public Product getProductById(int id);
    
    public void editProduct(Product product);

    public Product addProduct(Product product);
    
    public void deleteProduct(Product product);
    
    public Orders addOrder(Orders orders);
    
    public List<Orders> getOrders();

    public Orders getOrdersById(int id);
    
    public void editOrders(Orders orders);
    
    public void deleteOrders(Orders orders);
    
    public List<Machine> getMachine();

    public Machine getMachineById(int id);
    
    public void editMachine(Machine machine);

    public Machine addMachine(Machine machine);
    
    public void deleteMachine(Machine machine);
    
    public List<Production> getProduction();

    public Production getProductionById(int id);
    
    public void editProduction(Production production);

    public Production addProduction(Production production);
    
    public void deleteProduction(Production production);
    
    public List<Production> getProductionByUser(Users user);
    
    public List<Production> getInProductionByStatus(String prodStatus);
    
}
