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
import org.springframework.web.context.request.WebRequest;

import io.ldnr.teamc.pizzeria.datas.commande.Commande;
import io.ldnr.teamc.pizzeria.datas.commande.CommandeRepository;



@Controller
@RequestMapping("gerant")
public class GerantCommandesController {
	
	 @Autowired
	 private CommandeRepository repoCommande;
	
	 
	 @GetMapping(path = "commandes")
	 public String gestionCommandes(ModelMap pModel,WebRequest wRequest) {
		 
	  pModel.addAttribute("listecommandes",repoCommande.findAll());
	  return "gerant/gestioncommandes";
	 }
	 
	 @GetMapping(path= "commandes/update/{numero}")
	 public String updFormIngredient(ModelMap pModel,@PathVariable("numero") int numero) {
		 

			 Optional<Commande> optCommande = repoCommande.findById(numero);
			 
			 if (optCommande.isPresent())
			 {
				 Commande commande = optCommande.get();
				 pModel.addAttribute("commande", commande);
				 
				 return "gerant/updformcommande";
			 }
		 
		 return "redirect:/gerant/commandes";
	 }
	 
	 @PostMapping(path= "commandes/update")
	 public String updCommande(ModelMap pModel,@RequestParam Map<String,String> allParams) {
		 
		 if (allParams.containsKey("action") && allParams.get("action").equals("update"))
		 {
		 
			 int idCommande = Integer.parseInt(allParams.get("numero"));
			 Optional<Commande> optCommande = repoCommande.findById(idCommande);
			 
			 if (optCommande.isPresent())
			 {
				 Commande commande = optCommande.get();
				 String status =allParams.get("status");
				 
				 commande.setStatus(status);

				 repoCommande.save(commande);
			 }

		 }
		 return "redirect:/gerant/commandes";
	 }
	 
	 @GetMapping(path= "commandes/details/{numero}")
	 public String detailscommande(ModelMap pModel,@PathVariable("numero") int numero) {
		 

			 Optional<Commande> optCommande = repoCommande.findById(numero);
			 
			 if (optCommande.isPresent())
			 {
				 Commande commande = optCommande.get();
				 pModel.addAttribute("commande", commande);
				 
				 return "gerant/detailscommande";
			 }
		 
		 return "redirect:/gerant/commandes";
	 }
}
