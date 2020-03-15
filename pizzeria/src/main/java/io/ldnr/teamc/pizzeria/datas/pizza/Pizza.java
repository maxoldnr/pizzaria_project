package io.ldnr.teamc.pizzeria.datas.pizza;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import io.ldnr.teamc.pizzeria.datas.ingredient.Ingredient;

@Entity
@Table(name="pizza")
public class Pizza {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Integer id;
	 
     private String libelle;
     private Float prix;

	 public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public Float getPrix() {
		return prix;
	}

	public void setPrix(Float prix) {
		this.prix = prix;
	}

	public List<Ingredient> getCompoIngredient() {
		return compoIngredient;
	}

	public void setCompoIngredient(List<Ingredient> compoIngredient) {
		this.compoIngredient = compoIngredient;
	}
	
	public void addCompoIngredient(Ingredient ingredient)
	{
		this.compoIngredient.add(ingredient);
	}
	
	public void Clear()
	{
		this.compoIngredient.clear();
	}


	 
	 @ManyToMany(fetch = FetchType.EAGER)
	 @JoinTable(name="ingredient_pizza",joinColumns=@JoinColumn(name="pizza_id"),
	 	inverseJoinColumns=@JoinColumn(name="ingredient_id")
	 )
	 public List<Ingredient> compoIngredient = new ArrayList<Ingredient>();
}
