package fr.da2i.projetcal.entities;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import fr.da2i.projetcal.entities.Utilisateur;

public interface UtilisateurRepository extends CrudRepository<Utilisateur, String> {
    public List<Utilisateur> findAll();
    
    public Optional<Utilisateur> findById(String username);
}
