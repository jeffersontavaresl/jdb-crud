package br.com.projetoFinal;

import java.sql.SQLException;

import org.junit.Test;

import br.com.projetoFinal.model.Usuario;
import br.com.projetoFinal.persistence.UsuarioDao;
import junit.framework.TestCase;

public class UsuarioDaoTest extends TestCase{

	private UsuarioDao dao;
	private Usuario usuario; 
	
	@Test
	public void InserirUsuarioNoBancoTeste() throws SQLException {
		dao = new UsuarioDao(); 
		usuario = new Usuario("Pedro", "asjdkla@sakldja", "123");
		assertTrue(dao.insert(usuario));
	}

	@Test
	public void AcharUsuarioPorId() throws SQLException {
		Integer id = 6;
		assertNull(dao.findById(id));
	}

	@Test
	public void AtualizarDadosUsuario() throws SQLException {
		assertTrue(dao.update(usuario));
	}
	
	@Test
	public void DeletarUsuario() throws SQLException {
		Integer id = 40;
		assertNotNull(dao.delete(id));
	}

}
