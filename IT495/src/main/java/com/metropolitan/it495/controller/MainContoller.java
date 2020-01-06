/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it495.controller;

import com.metropolitan.it495.dao.CRUDDao;
import com.metropolitan.it495.entity.Category;
import com.metropolitan.it495.entity.Customer;
import com.metropolitan.it495.entity.Machine;
import com.metropolitan.it495.entity.Orders;
import com.metropolitan.it495.entity.Product;
import com.metropolitan.it495.entity.Production;
import com.metropolitan.it495.entity.Users;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Milos
 */
@Controller
public class MainContoller {
    
    @Autowired
    CRUDDao crudDao;
    
    @ControllerAdvice
    public class ProfilePicControllerAdvice {
        @ModelAttribute
        public void addProfilePicToModel(Model model) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();

            if(!"anonymousUser".equals(auth.getName())){
            String username = auth.getName();
            
            Users u = crudDao.findUserByUsername(username);
            model.addAttribute("profilePic", u.getProfilePic());
            }
        }
    }
    
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public ModelAndView defaultPage(@RequestParam(value = "error", required = false) String error) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid credentials!");
        }
        model.setViewName("login");
        return model;
    }
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView indexPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        List<Customer> c = crudDao.getCustomers();
        int r = c.size();
        model.addObject("broj", r);
        
        List<Product> p = crudDao.getProduct();
        int pr = p.size();
        model.addObject("brojP", pr);
        
        List<Users> u = (List<Users>) crudDao.getUsers();
        int us = u.size();
        model.addObject("brojU", us);
        
        List<Production> pro = crudDao.getInProductionByStatus("Izrada");
        int prod = pro.size();
        model.addObject("brojProd", prod);
        
        model.addObject("productions", crudDao.getProduction());
        model.addObject("products", crudDao.getProduct());
        model.addObject("machines", crudDao.getMachine());
        model.addObject("users", crudDao.getUsers());
        
        return model;
    }

    @RequestMapping(value = "/401", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);
            model.addObject("username", userDetail.getUsername());
        }
        model.setViewName("401");
        return model;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView getUsers(ModelAndView model) {
        model.addObject("users", crudDao.getUsers());
        model.addObject("user", new Users());
        return model;
    }
    
    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser(Model model) {
        model.addAttribute("user", new Users());
        return "addUser";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute("user") Users p, ModelAndView model) {
        Users exist = crudDao.findUserByUsername(p.getUsername());
        if (p.getFirstname().isEmpty()) {
            model.addObject("error", "First name cannot be empty!");
        } else if (p.getLastname().isEmpty()) {
            model.addObject("error", "Last name cannot be empty!");
        } else if (p.getEmail().isEmpty()) {
            model.addObject("error", "Email cannot be empty!");
        } else if (p.getUsername().isEmpty()) {
            model.addObject("error", "Username cannot be empty!");
        } else if (exist != null) {
            model.addObject("error", "Username already exists!");
        } else if (p.getPassword().isEmpty()) {
            model.addObject("error", "Password cannot be empty!");
        } else {
            String sha256hex = DigestUtils.sha256Hex(p.getPassword());
            p.setPassword(sha256hex);
            crudDao.addUser(p);
            model.addObject("successMsg", "Account successfully created.");
        }
        return model;
    }
    
    @RequestMapping(value = "/editUser", method = RequestMethod.GET)
    public String editUser(Model model) {
        model.addAttribute("user", new Users());
        return "addUser";
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
    public ModelAndView editUser(@ModelAttribute("user") Users p, ModelAndView model) {
        crudDao.editUser(p);
        model.addObject("user", p);
        return new ModelAndView("redirect:/users");
    }

    @RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("userId") int userId, HttpServletRequest request) {
        System.out.println("Fetching & Deleting user with id " + userId);
        Users user = crudDao.getUserById(userId);
        if (user == null) {
            System.out.println("Unable to delete. User with id " + userId + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteUser(user);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/customers", method = RequestMethod.GET)
    public ModelAndView getCustomers(ModelAndView model) {
        model.addObject("customers", crudDao.getCustomers());
        model.addObject("customer", new Customer());
        return model;
    }
    
    @RequestMapping(value = "/addCustomer", method = RequestMethod.GET)
    public String addCustomer(Model model) {
        model.addAttribute("customer", new Customer());
        return "addCustomer";
    }

    @RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
    public ModelAndView addCustomer(@ModelAttribute("customer") Customer c, ModelAndView model) {
        if (c.getFirstname().isEmpty()) {
            model.addObject("error", "First name cannot be empty!");
        } else if (c.getLastname().isEmpty()) {
            model.addObject("error", "Last name cannot be empty!");
        } else if (c.getEmail().isEmpty()) {
            model.addObject("error", "Email cannot be empty!");
        } else if (c.getAddress().isEmpty()) {
            model.addObject("error", "Address cannot be empty!");
        } else if (c.getCity().isEmpty()) {
            model.addObject("error", "City cannot be empty!");
        } else if (c.getJmbgPib().isEmpty()) {
            model.addObject("error", "JMBG/PIB cannot be empty!");
        } else if (c.getNumber().isEmpty()) {
            model.addObject("error", "Phone number cannot be empty!");
        } else {
            crudDao.addCustomer(c);
            model.addObject("successMsg", "Customer successfully added.");
        }
        return model;
    }
    
    @RequestMapping(value = "/editCustomer", method = RequestMethod.GET)
    public String editCustomer(Model model) {
        model.addAttribute("customer", new Customer());
        return "addCustomer";
    }

    @RequestMapping(value = "/editCustomer", method = RequestMethod.POST)
    public ModelAndView editCustomer(@ModelAttribute("customer") Customer c, ModelAndView model) {
        crudDao.editCustomer(c);
        model.addObject("customer", c);
        return new ModelAndView("redirect:/customers");
    }

    @RequestMapping(value = "/deleteCustomer/{customerId}", method = RequestMethod.GET)
    public String deleteCustomer(@PathVariable("customerId") int customerId, HttpServletRequest request) {
        System.out.println("Fetching & Deleting customer with id " + customerId);
        Customer customer = crudDao.getCustomerById(customerId);
        if (customer == null) {
            System.out.println("Unable to delete. Customer with id " + customerId + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteCustomer(customer);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/category", method = RequestMethod.GET)
    public ModelAndView getCategory(ModelAndView model) {
        model.addObject("categories", crudDao.getCategory());
        model.addObject("category", new Category());
        return model;
    }
    
    @RequestMapping(value = "/addCategory", method = RequestMethod.GET)
    public String addCategory(Model model) {
        model.addAttribute("category", new Category());
        return "addCategory";
    }

    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    public ModelAndView addCategory(@ModelAttribute("category") Category c, ModelAndView model) {
        if (c.getName().isEmpty()) {
            model.addObject("error", "Category name cannot be empty!");
        } else {
            crudDao.addCategory(c);
            model.addObject("successMsg", "Category successfully added.");
        }
        return model;
    }
    
    @RequestMapping(value = "/editCategory", method = RequestMethod.GET)
    public String editCategory(Model model) {
        model.addAttribute("category", new Category());
        return "addCategory";
    }

    @RequestMapping(value = "/editCategory", method = RequestMethod.POST)
    public ModelAndView editCategory(@ModelAttribute("category") Category c, ModelAndView model) {
        crudDao.editCategory(c);
        model.addObject("category", c);
        return new ModelAndView("redirect:/category");
    }

    @RequestMapping(value = "/deleteCategory/{categoryId}", method = RequestMethod.GET)
    public String deleteCategory(@PathVariable("categoryId") int categoryId, HttpServletRequest request) {
        System.out.println("Fetching & Deleting category with id " + categoryId);
        Category category = crudDao.getCategoryById(categoryId);
        if (category == null) {
            System.out.println("Unable to delete. Category with id " + categoryId + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteCategory(category);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView getProduct(ModelAndView model) {
        model.addObject("products", crudDao.getProduct());
        model.addObject("categories", crudDao.getCategory());
        model.addObject("product", new Product());
        return model;
    }
    
    @RequestMapping(value = "/addProduct", method = RequestMethod.GET)
    public String addProduct(Model model) {
        model.addAttribute("categories", crudDao.getCategory());
        model.addAttribute("product", new Product());
        return "addProduct";
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public ModelAndView addProduct(@ModelAttribute("product") Product p, ModelAndView model) {
        model.addObject("product", p);
        model.addObject("categories", crudDao.getCategory());
        if (p.getProductname().isEmpty()) {
            model.addObject("error", "Product name cannot be empty!");
        } else if (p.getPrice().isEmpty()){
            model.addObject("error", "Price cannot be empty!");
        } else if (p.getQuantity().isEmpty()){
            model.addObject("error", "Quantity cannot be empty!");
        } else if (p.getCategoryId() == null){
            model.addObject("error", "Category cannot be empty!");
        } else {
            crudDao.addProduct(p);
            model.addObject("successMsg", "Product successfully added.");
        }
        return model;
    }
    
    @RequestMapping(value = "/editProduct", method = RequestMethod.GET)
    public String editProduct(Model model) {
        model.addAttribute("product", new Product());
        return "addProduct";
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.POST)
    public ModelAndView editProduct(@ModelAttribute("product") Product p, ModelAndView model) {
        crudDao.editProduct(p);
        model.addObject("product", p);
        return new ModelAndView("redirect:/product");
    }

    @RequestMapping(value = "/deleteProduct/{productId}", method = RequestMethod.GET)
    public String deleteProduct(@PathVariable("productId") int productId, HttpServletRequest request) {
        System.out.println("Fetching & Deleting product with id " + productId);
        Product product = crudDao.getProductById(productId);
        if (product == null) {
            System.out.println("Unable to delete. Product with id " + productId + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteProduct(product);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public ModelAndView getOrders(ModelAndView model) {
        model.addObject("orders", crudDao.getOrders());
        model.addObject("customers", crudDao.getCustomers());
        model.addObject("products", crudDao.getProduct());
        model.addObject("order", new Orders());
        return model;
    }
    
    int productId = 0;
    
    @RequestMapping(value = "/addOrder", method = RequestMethod.GET)
    public String addOrder(@RequestParam(required = false, defaultValue="-1") int id,Model model) {
        if(id>0){
            Product product = crudDao.getProductById(id);      
            model.addAttribute("product", product);
            productId = id;
        }
        
        model.addAttribute("customers", crudDao.getCustomers());
        model.addAttribute("products", crudDao.getProduct());
        model.addAttribute("order", new Orders());
        return "addOrder";
    }

    @RequestMapping(value = "/addOrder", method = RequestMethod.POST)
    public ModelAndView addOrder(@ModelAttribute("order") Orders o, ModelAndView model) {
        model.addObject("order", o);
        model.addObject("customers", crudDao.getCustomers());
        model.addObject("products", crudDao.getProduct());
        Product product = crudDao.getProductById(productId);
        model.addObject("product", product);
        if (o.getCustomerId() == null) {
            model.addObject("error", "Customer cannot be empty!");
        } else if (o.getProductId() == null){
            model.addObject("error", "Product cannot be empty!");
        } else if (o.getQuantity().isEmpty()){
            model.addObject("error", "Quantity cannot be empty!");
        } else if (Integer.parseInt(o.getQuantity()) > Integer.parseInt(product.getQuantity())){
            model.addObject("error", "The quantity is too large! Out of stock!");
        } else if (Integer.parseInt(product.getQuantity()) == 0){
            model.addObject("error", "Out of stock!");
        } else if (o.getPrice().isEmpty()){
            model.addObject("error", "Price cannot be empty!");
        } else {
            Date date = new Date();
            String str = new SimpleDateFormat("dd-MM-yyyy HH:mm a").format(date);
            o.setOrderdate(str);
            crudDao.addOrder(o);
            int q = Integer.parseInt(product.getQuantity()) - Integer.parseInt(o.getQuantity());
            product.setQuantity(Integer.toString(q));
            crudDao.editProduct(product);
            model.addObject("successMsg", "Order created successfully.");
        }
        return model;
    }
    
    @RequestMapping(value = "/deleteOrder/{orderId}", method = RequestMethod.GET)
    public String deleteOrder(@PathVariable("orderId") int orderId, HttpServletRequest request) {
        System.out.println("Fetching & Deleting order with id " + orderId);
        Orders order = crudDao.getOrdersById(orderId);
        if (order == null) {
            System.out.println("Unable to delete. Order with id " + orderId + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteOrders(order);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/machine", method = RequestMethod.GET)
    public ModelAndView getMachine(ModelAndView model) {
        model.addObject("machines", crudDao.getMachine());
        model.addObject("machine", new Machine());
        return model;
    }
    
    @RequestMapping(value = "/addMachine", method = RequestMethod.GET)
    public String addMachine(Model model) {
        model.addAttribute("machine", new Machine());
        return "addMachine";
    }

    @RequestMapping(value = "/addMachine", method = RequestMethod.POST)
    public ModelAndView addMachine(@ModelAttribute("machine") Machine m, ModelAndView model) {
        if (m.getName().isEmpty()) {
            model.addObject("error", "Machine name cannot be empty!");
        } else {
            crudDao.addMachine(m);
            model.addObject("successMsg", "Machine successfully added.");
        }
        return model;
    }
    
    @RequestMapping(value = "/editMachine", method = RequestMethod.GET)
    public String editMachine(Model model) {
        model.addAttribute("machine", new Machine());
        return "addMachine";
    }

    @RequestMapping(value = "/editMachine", method = RequestMethod.POST)
    public ModelAndView editMachine(@ModelAttribute("machine") Machine m, ModelAndView model) {
        crudDao.editMachine(m);
        model.addObject("machine", m);
        return new ModelAndView("redirect:/machine");
    }

    @RequestMapping(value = "/deleteMachine/{machineId}", method = RequestMethod.GET)
    public String deleteMachine(@PathVariable("machineId") int machineId, HttpServletRequest request) {
        System.out.println("Fetching & Deleting machine with id " + machineId);
        Machine machine = crudDao.getMachineById(machineId);
        if (machine == null) {
            System.out.println("Unable to delete. Machine with id " + machineId + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteMachine(machine);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/production", method = RequestMethod.GET)
    public ModelAndView getProduction(ModelAndView model) {
        model.addObject("productions", crudDao.getProduction());
        model.addObject("products", crudDao.getProduct());
        model.addObject("machines", crudDao.getMachine());
        model.addObject("users", crudDao.getUsers());
        return model;
    }
    
    int prodID = 0;
    String productStatus ="";
    
    @RequestMapping(value = "/myProduction", method = RequestMethod.GET)
    public ModelAndView getmyProduction(ModelAndView model, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        Users u = crudDao.findUserByUsername(principal.getName());
        List<Production> p = crudDao.getProductionByUser(u);
        model.addObject("productions", p);
        model.addObject("products", crudDao.getProduct());
        model.addObject("machines", crudDao.getMachine());
        model.addObject("production", new Production());
        return model;
    }
    
    @RequestMapping(value = "/addProduction", method = RequestMethod.GET)
    public String addProduction(Model model) {
        model.addAttribute("products", crudDao.getProduct());
        model.addAttribute("machines", crudDao.getMachine());
        model.addAttribute("production", new Production());
        return "addProduction";
    }

    @RequestMapping(value = "/addProduction", method = RequestMethod.POST)
    public ModelAndView addProduction(@ModelAttribute("production") Production p, HttpServletRequest request, ModelAndView model) {
        model.addObject("production", p);
        model.addObject("products", crudDao.getProduct());
        model.addObject("machines", crudDao.getMachine());
        
        if (p.getProductId() == null) {
            model.addObject("error", "Product name cannot be empty!");
        } else if (p.getMachineId() == null){
            model.addObject("error", "Machine cannot be empty!");
        } else if (p.getProdStatus().isEmpty()){
            model.addObject("error", "State cannot be empty!");
        } else {
            Principal principal = request.getUserPrincipal();
            Users u = crudDao.findUserByUsername(principal.getName());
            p.setUser(u);
            crudDao.addProduction(p);
            model.addObject("successMsg", "Production successfully added.");
        }
        return model;
    }
    
    @RequestMapping(value = "/editProduction", method = RequestMethod.GET)
    public String editProduction(Model model) {
        model.addAttribute("production", new Production());
        return "addProduction";
    }

    @RequestMapping(value = "/editProduction", method = RequestMethod.POST)
    public ModelAndView editProduction(@ModelAttribute("production") Production p, HttpServletRequest request, ModelAndView model) {
        model.addObject("production", p);
        Principal principal = request.getUserPrincipal();
        Users u = crudDao.findUserByUsername(principal.getName());
        p.setUser(u);
        crudDao.editProduction(p);

        Product product = crudDao.getProductById(p.getProductId().getProductId());
        
        if (p.getProdStatus().equals("Zavrseno")){
            System.out.println(productStatus);
            int q = Integer.parseInt(product.getQuantity()) + 1;
            product.setQuantity(Integer.toString(q));
            crudDao.editProduct(product);
        }
        
        return new ModelAndView("redirect:/myProduction");
    }

    @RequestMapping(value = "/deleteProduction/{productionId}", method = RequestMethod.GET)
    public String deleteProduction(@PathVariable("productionId") int productionId, HttpServletRequest request) {
        System.out.println("Fetching & Deleting production with id " + productionId);
        Production production = crudDao.getProductionById(productionId);
        if (production == null) {
            System.out.println("Unable to delete. Production with id " + productionId + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteProduction(production);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView getProfile(ModelAndView model, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        Users u = crudDao.findUserByUsername(principal.getName());
        model.addObject("user", u);
        return model;
    }
    
    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public ModelAndView getProfile(@ModelAttribute("user") Users u, ModelAndView model, @RequestParam("file") MultipartFile file, HttpSession session) throws Exception {
        ServletContext context = session.getServletContext();
        String path = context.getInitParameter("upload.location");
        String filename = file.getOriginalFilename();
        

        byte[] bytes = file.getBytes();
        try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(path + File.separator + filename)))) {
            stream.write(bytes);
            stream.flush();
        }

        u.setProfilePic("images/" + filename);
        model.addObject("object", u);
        crudDao.editUser(u);
        Thread.sleep(2000);
        model.setViewName("redirect:/profile");
        return model;

    }

}
