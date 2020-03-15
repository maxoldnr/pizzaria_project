package io.ldnr.teamc.pizzeria.gerant;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.ldnr.teamc.pizzeria.datas.ingredient.Ingredient;
import io.ldnr.teamc.pizzeria.datas.ingredient.IngredientRepository;



@Controller
@RequestMapping("gerant")
public class GerantIngredientsController {
	
	 @Autowired
	 private IngredientRepository repoIngredient;
	
	 
	 @GetMapping(path = "ingredients")
	 public String gestionIngredient(ModelMap pModel) {
	  pModel.addAttribute("listeingredients",repoIngredient.findAll());
	  //return "welcome";
	  return "gerant/gestioningredients";
	 }
	 
	 @GetMapping(path = "ingredients/del")
	 public String delIngredient(ModelMap pModel,@RequestParam String id) {
		 int idIngredient = Integer.parseInt(id);
		 Optional<Ingredient> optIngredient = repoIngredient.findById(idIngredient);
		 if(optIngredient.isPresent())
		 {
			 repoIngredient.deleteById(idIngredient);
		 }
		 return  "redirect:/gerant/ingredients";
	}
	 
	 @PostMapping(path= "ingredients/add")
	 public String addIngredient(ModelMap pModel,@RequestParam Map<String,String> allParams) {
		 
		 if (allParams.containsKey("action") && allParams.get("action").equals("creer"))
		 {
		 
			 String nom =allParams.get("nom");
			 float prix = Float.parseFloat(allParams.get("prix"));
			 
			 
			 Ingredient ingredient = new Ingredient();
			 ingredient.setNom(nom);
			 ingredient.setPrix(prix);
			 
			 repoIngredient.save(ingredient);

			 return "redirect:/gerant/ingredients";
		 
		 }
		 else
		 {
			 return "redirect:/gerant/ingredients";
		 }
	 }
	 
	 @GetMapping(path= "ingredients/update/{id}")
	 public String addFromIngredient(ModelMap pModel,@PathVariable("id") int id) {
		 

			 Optional<Ingredient> optIngredient = repoIngredient.findById(id);
			 
			 if (optIngredient.isPresent())
			 {
				 Ingredient ingredient = optIngredient.get();
				 pModel.addAttribute("ingredient", ingredient);
				 
				 return "gerant/gestionupdingredient";
			 }
		 
		 return "redirect:/gerant/ingredients";
	 }
	 
	 @PostMapping(path= "ingredients/update")
	 public String updIngredient(ModelMap pModel,@RequestParam Map<String,String> allParams) {
		 
		 if (allParams.containsKey("action") && allParams.get("action").equals("update"))
		 {
		 
			 int idIngredient = Integer.parseInt(allParams.get("id"));
			 Optional<Ingredient> optIngredient = repoIngredient.findById(idIngredient);
			 
			 if (optIngredient.isPresent())
			 {
				 Ingredient ingredient = optIngredient.get();
				 String nom =allParams.get("nom");
				 float prix = Float.parseFloat(allParams.get("prix"));
				 
				 ingredient.setNom(nom);
				 ingredient.setPrix(prix);
				 
				 repoIngredient.save(ingredient);
			 }

		 }
		 return "redirect:/gerant/ingredients";
	 }
	 
	 
	 
	
}
