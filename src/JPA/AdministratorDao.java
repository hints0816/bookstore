package JPA;  
  
import java.util.List;

import javax.persistence.EntityManager;  
import javax.persistence.EntityManagerFactory;  
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.junit.BeforeClass;  
import org.junit.Test;

import Util.EntityManagerUtil;
import model.Administrator;
  
  
public class AdministratorDao {  
    @BeforeClass  
    public static void setUpBeforeClass() throws Exception {  
    }  
  
    @Test  
    public void createTable() {  
        // 可以验证生成表是否正确  
        EntityManagerFactory factory = Persistence  
                .createEntityManagerFactory("BookStore");  
        factory.close();  
    }  
  
    @Test  
    public void save(Administrator admin) {  
    	EntityManager em=EntityManagerUtil.getEntityManager();  
        em.getTransaction().begin();  
        em.persist(admin); //持久化实体  
        em.getTransaction().commit();  
        em.close();  
    }  
    @Test public void update(Administrator admin){  
    	EntityManager em=EntityManagerUtil.getEntityManager();
        em.clear();
        em.getTransaction().begin();  
        em.merge(admin); 
        em.getTransaction().commit();  
        em.close();  
    }  
//  删除
    @Test public void remove(String admin){  
    	EntityManager em=EntityManagerUtil.getEntityManager();
    	Administrator administrator = em.find(Administrator.class,admin); 
        em.getTransaction().begin();
        em.remove(administrator);
        em.getTransaction().commit();  
        em.close();  
    }  
}  