package io.ldnr.teamc.pizzeria.client;

import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import io.ldnr.teamc.pizzeria.datas.commande.Commande;
import io.ldnr.teamc.pizzeria.datas.commande.CommandeRepository;
import io.ldnr.teamc.pizzeria.datas.ingredient.IngredientRepository;
import io.ldnr.teamc.pizzeria.datas.pizza.Pizza;
import io.ldnr.teamc.pizzeria.datas.pizza.PizzaRepository;
import io.ldnr.teamc.pizzeria.datas.user.User;
import io.ldnr.teamc.pizzeria.datas.user.UserRepository;

@Controller
@RequestMapping("client")
public class ClientCommandeController {

	@Autowired
	PizzaRepository repositoryPizza;
	@Autowired
	IngredientRepository repositoryIngredient;
	@Autowired
	UserRepository repositoryUser;
	@Autowired
	CommandeRepository repositoryCommande;

	@PostMapping(path= "panier/add")
	public String addPizzaPanier(ModelMap pModel,@RequestParam Map<String,String> allParams,HttpServletRequest request) {
		System.out.println("ok panieradd");
		Panier panier = null;
		Pizza pizza = null;
		panier=(Panier) request.getSession().getAttribute("panier");
		for (Map.Entry<String, String> param : allParams.entrySet())
		{
			if (param.getKey().startsWith("pizza_"))
			{
				int pizzaId = Integer.parseInt(param.getValue());


				Optional<Pizza> opizza= repositoryPizza.findById(pizzaId);
				if(opizza.isPresent())
				{
					pizza = opizza.get();

					panier.add(pizza);
				}
			}
		}
		if(panier != null) {}
		Set<Pizza> pizzas = panier.getAll();
		for(Pizza p : pizzas) {
			System.out.println(p.getLibelle());
		}


		pModel.addAttribute("listepizzas",repositoryPizza.findAll());

		return "client/ajoutPizzasPanier";

	}

	@GetMapping(path= "panier/afficher")
	public String afficherPanier(ModelMap pModel,HttpServletRequest request) {

		HttpSession session=request.getSession();
		if(session.getAttribute("panier")==null) {
			return "redirect:/client/choix";
		}
		Panier panier=(Panier) request.getSession().getAttribute("panier");

		pModel.addAttribute("listepizzas",panier.getAll());
		pModel.addAttribute("nbPizza", panier.getAll().size());
		if (request.getSession().getAttribute("SESSION_USER") !=null)
		{
			pModel.addAttribute("montantreduit", panier.getMontantReduction());
		}
		pModel.addAttribute("montant", panier.getMontant());
		return "client/afficherPanier";
	}

	@GetMapping(path= "choix")
	public String choixPizza(ModelMap pModel, HttpServletRequest request) {


		HttpSession session=request.getSession();

		if(session.getAttribute("panier")==null) {
			Panier panier = new Panier();
			session.setAttribute("panier", panier);
		}

		// HttpServeletRequest.
		pModel.addAttribute("listepizzas",repositoryPizza.findAll());
		return "client/ajoutPizzasPanier";
	}

	@PostMapping  (path="panier/confirm")
	public String confirmerCommande(HttpServletRequest request){

		Panier panier = (Panier) request.getSession().getAttribute("panier");


		Commande cmd = new Commande();
		cmd.setStatus("En cours");
		cmd.setUser_id(panier.getUser());

		cmd.setPizzas(panier.getAll());

		repositoryCommande.save(cmd);

		request.getSession().removeAttribute("panier");

		return "client/confirm";
	}

	@GetMapping(path="panier/paiement")
	public String payerCommande(HttpServletRequest request,ModelMap pModel){

		User u=null;

		Panier panier = (Panier) request.getSession().getAttribute("panier");

		//recuperation user en session
		if (request.getSession().getAttribute("SESSION_USER") !=null)
		{
			u = (User)request.getSession().getAttribute("SESSION_USER");
		}
		else
		{

			if (request.getSession().getAttribute("SESSION_ADMIN") !=null)
			{
				u = (User)request.getSession().getAttribute("SESSION_ADMIN");
			}

		}

		if (u==null && panier.getUser()==null)
		{
			return "redirect:/client/infoClient";
		}
		else if (u!=null)
		{
			panier.setUser(u);
			request.getSession().setAttribute("panier",panier);
		}


		pModel.addAttribute("montant", panier.getMontant());
		pModel.addAttribute("nbPizza", panier.getAll().size());
		if (request.getSession().getAttribute("SESSION_USER") !=null)
		{
			pModel.addAttribute("montantreduit", panier.getMontantReduction());
		}

		return "client/paiement";


	}


	@RequestMapping(value = "/infoClient", method = RequestMethod.GET)
	public ModelAndView showFormInscription() {

		return new ModelAndView("client/infoClient", "addformAction", new User());
	}

	@PostMapping("/addformAction")
	public String submitFormInscription(@ModelAttribute("addformAction") User user,
			Model model,HttpServletRequest request) throws NoSuchAlgorithmException {

		user.setLogin("undefined");
		user.setPasswd("undefined");
		repositoryUser.save(user);

		Panier panier = (Panier) request.getSession().getAttribute("panier");
		panier.setUser(user);
		request.getSession().setAttribute("panier",panier);


		return "redirect:/client/panier/paiement";


	}


	@PostMapping(path= "panier/del")
	public String supprimerPizzasPanier(ModelMap pModel,HttpServletRequest request,@RequestParam Map<String,String> allParams) {
		Panier panier=(Panier) request.getSession().getAttribute("panier");

		for (Map.Entry<String, String> param : allParams.entrySet())
		{
			if (param.getKey().startsWith("pizza_"))
			{
				int pizzaId = Integer.parseInt(param.getValue());
				Pizza pizza=panier.findById(pizzaId);
				if(panier.delete(pizza)==null) {
					System.out.println("pas bon");
				}
			}

		}



		pModel.addAttribute("listepizzas",panier.getAll());
		return "client/afficherPanier";
	}


}




