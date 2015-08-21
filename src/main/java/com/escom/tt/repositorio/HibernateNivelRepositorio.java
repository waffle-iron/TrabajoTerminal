package com.escom.tt.repositorio;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class HibernateNivelRepositorio {
private SessionFactory sf;

}
