package fr.da2i.projetcal.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Entity
@Data
@Table(name="rdvmedecin")

public class Rdvmedecin {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int numrdv;
	
	@DateTimeFormat(pattern= "yyyy-MM-dd HH:mm")
	private Date date;
	
	private int limite=2;
	
	@ManyToOne
    @JoinColumn(name = "username")
	private Utilisateur user;

	public int getNumrdv() {
		return numrdv;
	}

	public void setNumrdv(int numrdv) {
		this.numrdv = numrdv;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getLimite() {
		return limite;
	}

	public void setLimite(int limite) {
		this.limite = limite;
	}

	public Utilisateur getUser() {
		return user;
	}

	public void setUser(Utilisateur user) {
		this.user = user;
	}
	
	
	
}
