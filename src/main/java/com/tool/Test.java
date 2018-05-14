package com.tool;

import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.hibernate.tool.schema.TargetType;

import java.util.EnumSet;

public class Test {
    public static void main(String[] args){
        ServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
        Metadata metadata = new MetadataSources(registry).buildMetadata();
        SchemaExport export = new SchemaExport();
        export.create(EnumSet.of(TargetType.DATABASE),metadata);
    // Session session= DBHelper.getSession();
    /*   Group g=new Group();
       g.setGname("第一组");
        Group g2=new Group();
        g2.setGname("第2组");
        User u=new User();
        u.setUserName("aa");
        List list=new ArrayList();
        list.add(g);
        list.add(g2);
        u.setGroups(list);*/

       /* Transaction transaction=session.beginTransaction();
        session.save(g);
        session.save(g2);
        session.save(u);
        transaction.commit();*/




       /* Query q=session.createQuery("from Group ");
        List a=q.list();
        for(Object gx:a){
            Group gp= (Group) gx;
            System.out.println( gp.getUsers());
        }*/
    }
    @org.junit.Test
    public void test(){

    }
}
