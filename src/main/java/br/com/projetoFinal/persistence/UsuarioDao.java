package br.com.projetoFinal.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoFinal.model.Telefone;
import br.com.projetoFinal.model.Usuario;

public class UsuarioDao {

	/**
	 * METODO PARA INSERIR UM USUARIO NO BANCO DE DADOS
	 * 
	 * @return
	 * @throws SQLException
	 */

	public boolean insert(Usuario usuario) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?);";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setString(1, usuario.getNome());
				stm.setString(2, usuario.getEmail());
				stm.setString(3, usuario.getSenha());
				stm.execute();
				return true;
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return false;
		}
	}

	/**
	 * METODO PARA PROCURAR UM USUARIO NO BANCO ATRAVES DO ID
	 * 
	 * @param id identificacao do usuario
	 * @return retorna o usuario
	 * @throws SQLException
	 */
	public Usuario findById(Integer id) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "SELECT id, nome, email, senha FROM usuarios WHERE id = ? ORDER BY nome;";
			Usuario usuario = null;
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setInt(1, id);
				try (ResultSet rs = stm.executeQuery()) {
					if (rs.next()) {
						usuario = new Usuario();
						usuario.setId(rs.getInt("id"));
						usuario.setNome(rs.getString("nome"));
						usuario.setEmail(rs.getString("email"));
						usuario.setSenha(rs.getString("senha"));
					}
				}
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return usuario;
		}
	}

	/**
	 * METODO QUE GERA UMA LISTA COM TODOS OS DADOS DE UM USUARIO ESPECIFICADO PELO ID
	 * 
	 * @param id
	 * @return lista com os dados do usuario informado
	 * @throws SQLException
	 */

	public List<Usuario> findByIdList(Integer id) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			List<Usuario> lista = new ArrayList<>();
			String sql = "SELECT id, nome, email FROM usuarios WHERE id = ? ORDER BY nome;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setInt(1, id);
				try (ResultSet rs = stm.executeQuery()) {
					while (rs.next()) {
						Usuario usuario = new Usuario();
						usuario.setId(rs.getInt("id"));
						usuario.setNome(rs.getString("nome"));
						usuario.setEmail(rs.getString("email"));
						lista.add(usuario);
					}
				}
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return lista;
		}
	}

	/**
	 * MÉTODO PARA BUSCAR TODOS OS USÚARIOS NO BANCO
	 * 
	 * @return lista com todos os usuarios
	 * @throws SQLException
	 */

	public List<Usuario> findAll() throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			List<Usuario> lista = new ArrayList<>();
			String sql = "SELECT id, nome, email FROM usuarios ORDER BY nome;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				try (ResultSet rs = stm.executeQuery()) {
					while (rs.next()) {
						Usuario usuario = new Usuario();
						usuario.setId(rs.getInt("id"));
						usuario.setNome(rs.getString("nome"));
						usuario.setEmail(rs.getString("email"));
						lista.add(usuario);
					}
				}
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return lista;
		}
	}

	/** MÉTODO PARA CRIAR UMA LISTA COM TODOS OS TELEFONES LIGADOS A UM ÚNICO USUARIO
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<Usuario> findAllTel(Integer id) throws SQLException {
		List<Usuario> listaTel = new ArrayList<>();
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "SELECT * FROM usuarios a "
					+ 	 "JOIN telefone b "
					+ 	 "	ON a.id = b.idUsuario "
					+ 	 "WHERE a.id = ?;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setInt(1, id);
				try (ResultSet rs = stm.executeQuery()) {
					while (rs.next()) {
						Usuario usuario = new Usuario();
						Telefone tel = new Telefone();
						List<Telefone> telefones = new ArrayList<>();
						usuario.setId(rs.getInt("id"));
						usuario.setNome(rs.getString("nome"));
						usuario.setEmail(rs.getString("email"));
						tel.setId(rs.getInt("id"));
						tel.setDdd(rs.getInt("ddd"));
						tel.setNumero(rs.getString("numero"));
						tel.setTipo("tipo");
						telefones.add(tel);
						usuario.setTelefone(telefones);
						listaTel.add(usuario);
					}
				}
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return listaTel;
		}
	}

	/**
	 * MÉTODO PARA ATUALIZAR OS DADOS DO USUARIO
	 * 
	 * @return true caso seja concluido com sucesso
	 * @throws SQLException
	 */

	public boolean update(Usuario usuario) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "UPDATE usuarios SET nome = ?, email = ?, senha = ? WHERE id = ?;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setString(1, usuario.getNome());
				stm.setString(2, usuario.getEmail());
				stm.setString(3, usuario.getSenha());
				stm.setInt(4, usuario.getId());
				stm.execute();
				return true;
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return false;
		}
	}

	/**
	 * MÃ‰TODOS PARA DELETAR O USUÃ�RIO E TODOS OS NÃšMEROS CADASTRADOS COM ELE
	 * 
	 * @param id identificacao do usuario
	 * @return confirmaacao da acao
	 */
	public boolean delete(Integer id) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "DELETE FROM usuarios WHERE id = ?;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setInt(1, id);
				stm.execute();
				return true;
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return false;
		}
	}
}
