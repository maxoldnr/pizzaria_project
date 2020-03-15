package io.ldnr.teamc.pizzeria.gerant;

import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.ldnr.teamc.pizzeria.datas.ingredient.Ingredient;
import io.ldnr.teamc.pizzeria.datas.ingredient.IngredientRepository;
import io.ldnr.teamc.pizzeria.datas.pizza.Pizza;
import io.ldnr.teamc.pizzeria.datas.pizza.PizzaRepository;

@Controller
@RequestMapping("gerant")
public class GerantPizzasController {

	@Autowired
	PizzaRepository repoPizza;
	
	@Autowired
	IngredientRepository repoIngredient;
	
	 @GetMapping(path = "carte")
	 public String gestioncarte(ModelMap pModel) {
	  pModel.addAttribute("listepizzas",repoPizza.findAll());
	  return "gerant/gestioncarte";
	 }
	 
	 @GetMapping(path = "carte/pizza/add")
	 public String addFormPizza(ModelMap pModel) {
	  pModel.addAttribute("listeingredients",repoIngredient.findAll());
	  return "gerant/gestionaddpizza";
	 }
	 
	 @PostMapping(path= "carte/pizza/add")
	 public String addPizza(ModelMap pModel,@RequestParam Map<String,String> allParams) {
		 
		 if (allParams.containsKey("action") && allParams.get("action").equals("creer"))
		 {
		 
			 String libelle =allParams.get("libelle");
			 float prix = Float.parseFloat(allParams.get("prix"));
			 			 
			 Pizza pizza = new Pizza();
			 pizza.setLibelle(libelle);
			 pizza.setPrix(prix);
			 
			 
			 //ajout des ingredients des case a cochez du formulaire
			 for (Map.Entry<String, String> param : allParams.entrySet())
			 {
				 if (param.getKey().startsWith("ingre"))
				 {
					 int idIngredient = Integer.parseInt(param.getValue());
					 Optional<Ingredient> optIngredient = repoIngredient.findById(idIngredient);
					 if(optIngredient.isPresent())
					 {
						 Ingredient ingredient = optIngredient.get();
						 pizza.addCompoIngredient(ingredient);
					 }
				 }
				 
			 }
			 			 
			 repoPizza.save(pizza);

			 return "redirect:/gerant/carte";
		 
		 }
		 else
		 {
			 return "redirect:/gerant/carte";
		 }
	 }
	 
	 @GetMapping(path= "carte/pizza/upd/{id}")
	 public String updFromPizza(ModelMap pModel,@PathVariable("id") int id) {
		 

			 Optional<Pizza> optPizza = repoPizza.findById(id);
			 Iterable<Ingredient> ingredient = repoIngredient.findAll();
			 
			 if (optPizza.isPresent())
			 {
				 Pizza pizza = optPizza.get();
				 pModel.addAttribute("pizza", pizza);
				 pModel.addAttribute("listeingredients", ingredient);
				 
				 return "gerant/gestionupdpizza";
			 }
		 
		 return "redirect:/gerant/carte";
	 }
	 
	 @PostMapping(path= "carte/pizza/upd")
	 public String updPizza(ModelMap pModel,@RequestParam Map<String,String> allParams) {
		 
		 if (allParams.containsKey("action") && allParams.get("action").equals("modifier"))
		 {
		 
			 int idPizza = Integer.parseInt(allParams.get("id"));
			 Optional<Pizza> optPizza = repoPizza.findById(idPizza);

			 if(optPizza.isPresent())
			 {
				 Pizza pizza=optPizza.get();
		
			 
				 String libelle =allParams.get("libelle");
				 float prix = Float.parseFloat(allParams.get("prix"));
				 			 
				 pizza.setLibelle(libelle);
				 pizza.setPrix(prix);
			 
			 
				 pizza.Clear();
				 //ajout des ingredients des case a cochez du formulaire
				 for (Map.Entry<String, String> param : allParams.entrySet())
				 {
					 if (param.getKey().startsWith("ingre"))
					 {
						 int idIngredient = Integer.parseInt(param.getValue());
						 Optional<Ingredient> optIngredient = repoIngredient.findById(idIngredient);
						 if(optIngredient.isPresent())
						 {
							 Ingredient ingredient = optIngredient.get();
							 pizza.addCompoIngredient(ingredient);
						 }
					 }
					 
				 }
			 			 
				 repoPizza.save(pizza);
				 
			 }
			 return "redirect:/gerant/carte";
		 
		 }
		 else
		 {
			 return "redirect:/gerant/carte";
		 }
	 }	 
	 
	 @GetMapping(path = "carte/pizza/del")
	 public String delPizza(ModelMap pModel,@RequestParam String id,HttpServletRequest request) {
		 
		 if (request.getSession().getAttribute("SESSION_ADMIN") ==null)
		 {
			 return  "redirect:/";
		 }
		 
		 int idPizza = Integer.parseInt(id);
		 Optional<Pizza> optPizza = repoPizza.findById(idPizza);
		 if(optPizza.isPresent())
		 {
			 repoPizza.deleteById(idPizza);
		 }
		 return  "redirect:/gerant/carte";
	}
	 
	 	 
	
	
}
