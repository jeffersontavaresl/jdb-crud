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
	 * MÉTODO PARA INSERIR UM USUÁRIO NO BANCO DE DADOS
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
	 * MÉTODO PARA PROCURAR UM USUÁRIO NO BANCO ATRAVÉS DO ID
	 * 
	 * @param id identificação do usuário
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
	 * MÉTODO QUE GERA UMA LISTA COM TODOS OS DADOS DE UM USUÁRIO ESPECIFICADO PELO
	 * ID
	 * 
	 * @param id
	 * @return lista com os dados do usuário informado
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
	 * MÉTODO PARA BUSCAR TODOS OS USUÁRIOS NO BANCO
	 * 
	 * @return lista com todos os usuários
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

	/** MÉTODO PARA CRIAR UMA LISTA COM TODOS OS TELEFONES LIGADOS A UM ÚNICO USUÁRIO
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<Usuario> findAllTel(Integer id) throws SQLException {
		List<Usuario> listaTel = new ArrayList<>();
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "SELECT a.id, a.nome, a.email, b.id, b.ddd, b.numero, b.idUsuario, b.tipo "
					+ "FROM usuarios a, telefone b WHERE a.id = ? AND a.id = b.idUsuario;";
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
	 * MÉTODO PARA ATUALIZAR OS DADOS DO USUÁRIO
	 * 
	 * @return true caso seja concluído com sucesso
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
	 * MÉTODOS PARA DELETAR O USUÁRIO E TODOS OS NÚMEROS CADASTRADOS COM ELE
	 * 
	 * @param id identificação do usuário
	 * @return confirmação da ação
	 */
	public boolean delete(Integer id) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			TelefoneDao tel = new TelefoneDao();
			String sql = "DELETE FROM usuarios WHERE id = ?;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				tel.deleteTelefoneByUser(id);
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
