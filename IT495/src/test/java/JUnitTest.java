/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.metropolitan.it495.dao.CRUDDao;
import com.metropolitan.it495.entity.Category;
import com.metropolitan.it495.entity.Customer;
import com.metropolitan.it495.entity.Machine;
import com.metropolitan.it495.entity.Orders;
import com.metropolitan.it495.entity.Product;
import com.metropolitan.it495.entity.Production;
import java.util.List;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author Milos
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/resources/test-dispatcher-servlet.xml"})
public class JUnitTest {
    
    @Autowired
    protected CRUDDao crudDao;
    
    @Autowired
    private ApplicationContext context;
    
    public JUnitTest() {
    }
    
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

//   @Test
//    public void addUserTest(){
//        Machine m = new Machine();
//        m.setName("test");
//        Machine newM = crudDao.addMachine(m);
//        crudDao.deleteMachine(newM);
//        Machine deletedMachine = crudDao.getMachineById(newM.getMachineId());
//        Assert.assertNull(deletedMachine);
//    }
    
    @Test
    public void getProductionTest() {
        List<Production> get = crudDao.getProduction();
        Assert.assertNotNull(get);
    }
    
    @Test
    public void getProductTest() {
        List<Product> get = crudDao.getProduct();
        Assert.assertNotNull(get);
    }
    
    @Test
    public void getOrdersTest() {
        List<Orders> get = crudDao.getOrders();
        Assert.assertNotNull(get);
    }
    
    @Test
    public void getMachineTest() {
        List<Machine> get = crudDao.getMachine();
        Assert.assertNotNull(get);
    }
    
    @Test
    public void getCustomerTest() {
        List<Customer> get = crudDao.getCustomers();
        Assert.assertNotNull(get);
    }
    
    @Test
    public void getCategoryTest() {
        List<Category> get = crudDao.getCategory();
        Assert.assertNotNull(get);
    }
}
