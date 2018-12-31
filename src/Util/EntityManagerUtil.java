package Util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManagerUtil {
	  private static final EntityManagerFactory entityManagerFactory;
	  static {
	    try {
	      entityManagerFactory = Persistence.createEntityManagerFactory("BookStore");

	    } catch (ExceptionInInitializerError ex) {
	      System.err.println("��ʼ��ʵ�����������ʧ�ܡ�" + ex);
	      throw new ExceptionInInitializerError(ex);
	    }
	  }
	  public static EntityManager getEntityManager() {
	    return entityManagerFactory.createEntityManager();

	  }
	}