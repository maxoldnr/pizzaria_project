package io.ldnr.teamc.pizzeria.client;

import java.util.HashSet;
import java.util.Set;

import io.ldnr.teamc.pizzeria.datas.pizza.Pizza;
import io.ldnr.teamc.pizzeria.datas.user.User;

public class Panier {

	private float montant=0f;
	private float reduction=0.1f;
	private User user;
	
	private Set<Pizza> pizzas;
	 
	public Panier() {
		pizzas = new HashSet<Pizza>();
	}
	
	public void add(Pizza pizza) {
		pizzas.add(pizza);
		montant+=pizza.getPrix();
	}
	
	public Pizza delete(Pizza pizza) {
		if(pizzas.remove(pizza)) {
			return pizza;
		}
		else{
			return null;
		}
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Pizza findById(Integer id) {
		
		for(Pizza p:pizzas) {
			if(p.getId()==id) {
				return p;
			}
		}
		
		return null;
	}
	
	public Set<Pizza> getAll(){
		return pizzas;
	}
	
	
	public float getMontant() {
		
		return montant;
		
	}
	
	public float getMontantReduction() {
		
		return montant - (montant * reduction);
		
	}
	
	
}
