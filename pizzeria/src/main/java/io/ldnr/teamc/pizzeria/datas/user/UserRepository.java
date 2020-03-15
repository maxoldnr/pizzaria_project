package io.ldnr.teamc.pizzeria.datas.user;



import org.springframework.data.jpa.repository.Query;

import org.springframework.data.repository.CrudRepository;
public interface UserRepository extends CrudRepository<User,Integer>{

	@Query("select u from User u where u.login = ?1") User findByLogin(String login);

}


