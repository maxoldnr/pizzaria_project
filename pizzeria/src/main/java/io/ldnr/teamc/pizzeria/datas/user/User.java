package io.ldnr.teamc.pizzeria.datas.user;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import io.ldnr.teamc.pizzeria.datas.commande.Commande;



@Entity
@Table(name="user")
public class User {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Integer id;
	 
	    @NotNull
	    @Column(name = "nom", nullable = false)
	    private String nom;
	    
	    @NotNull
	    @Column(name = "prenom", nullable = true)
	    private String prenom;
	    
	    @NotNull
	    @Column(name = "adresse", nullable = true)
	    private String adresse;
	    
	    @NotNull
	    @Column(name = "login", nullable = false, unique = true)
	    private String login;
	    
	    @NotNull
	    @Column(name = "passwd", nullable = false, unique = true)
	    private String passwd;   

	    @Transient
	    private String cpasswd;
	    
	    @Column(name = "role", columnDefinition = "default 'VISITEUR")
	    private String role;
	    
	    
	   /* @Column(name = "role", nullable = false)
	    @Enumerated(Type.STRING)
	    private Collection<RoleEnum> roles;
	    */

	    @OneToMany(mappedBy="user_id", fetch = FetchType.LAZY)
	    private Collection<Commande> commandes;
	    
	    
	    /*@ElementCollection(targetClass = RoleEnum.class, fetch = FetchType.EAGER)
	    @Cascade(value = CascadeType.REMOVE)
	    @JoinTable(indexes = {@Index(name = "INDEX_USER_ROLE", columnList = "id")},
	            name = "roles",
	            joinColumns = @JoinColumn(name = "id")
	    )*/
	    
	    public User() {
	    	super();
	   
	        this.nom = "";
	        this.prenom = "";
	        //this.roles = Collections.singletonList(RoleEnum.VISITEUR);

	    }
	    
	    public User(String nom, String prenom, String email, String adresse, String login, String passwd, Collection<RoleEnum>roles ) {
	    	super();
	        this.nom = nom;
	        this.prenom = prenom;
	        this.adresse= adresse;
	        this.login=login;

	        this.passwd = passwd;	        
	       // this.roles = roles;

	    }
	    
	    public void setNom(String nom) {
			this.nom = nom;
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getNom() {
			return nom;
		}

		
		public String getPrenom() {
			return prenom;
		}

		public void setPrenom(String prenom) {
			this.prenom = prenom;
		}

		public String getAdresse() {
			return adresse;
		}

		public void setAdresse(String adresse) {
			this.adresse = adresse;
		}

		public String getLogin() {
			return login;
		}

		public void setLogin(String login) {
			this.login = login;
		}

		public String getPasswd() {
			return passwd;
		}

		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}
		
		/*public Collection<RoleEnum> getRoles() {
			return roles;
		}

		public void setRoles(Collection<RoleEnum> roles) {
			this.roles = roles;
		}*/

		public String getCpasswd() {
			return cpasswd;
		}

		public void setCpasswd(String cpasswd) {
			this.cpasswd = cpasswd;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public Collection<Commande> getCommandes() {
			return commandes;
		}

		public void setCommandes(Collection<Commande> commandes) {
			this.commandes = commandes;
		}


}
