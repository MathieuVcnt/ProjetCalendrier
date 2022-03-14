package fr.da2i.projetcal;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import fr.da2i.projetcal.entities.*;
import fr.da2i.projetcal.repository.UtilisateurRepository;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource datasource;
	
	@Autowired
	UtilisateurRepository u;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
			http
				.authorizeRequests().mvcMatchers("/menupiscine","/profil","/planningmedecin","/menu","menumedecin").authenticated()
				.mvcMatchers("/login","/inscription").permitAll()
				.anyRequest().authenticated().and()
//.httpBasic();
//la page de login est fournie
				.formLogin().loginPage("/login").loginProcessingUrl("/menu").defaultSuccessUrl("/menu",true)// .loginPage("/login")
				.and()
// la page de logout est fournie
				.logout()
// on redirige o� on veut .logoutSuccessUrl("/public")
				.permitAll().and().rememberMe();
	}
	

	@Autowired
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		//auth.inMemoryAuthentication().withUser("paul").password(encoder.encode("paul")).authorities("USER");
		//auth.inMemoryAuthentication().withUser("jean").password(encoder.encode("jean")).authorities("ADMIN");
		Utilisateur admin = new Utilisateur();
		admin.setUsername("admin");
		admin.setPassword(encoder.encode("admin"));
		admin.setAuthority("ADMIN");
		admin.setEnabled(true);
		u.save(admin);
		
		auth
		.jdbcAuthentication().dataSource(datasource)
        .passwordEncoder(encoder)
        .usersByUsernameQuery("select username,password,enabled "
        		+ "from Users "
        		+ "where username =?")
        .authoritiesByUsernameQuery(" select username, authority "
        		+ "from Users "
        		+ "where username =?");
	}
    
    @Bean
    public JdbcUserDetailsManager udm() {
        JdbcUserDetailsManager udm = new JdbcUserDetailsManager(); 
        udm.setDataSource(datasource);
        return udm;
    }
}
