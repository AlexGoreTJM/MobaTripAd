package moba.model.entity;

public class CategoriaBean {

	private int idCategoria;
	private String nome;
	private String img;
	private String info;

	public int getIdCategoria() {
		return idCategoria;
	}

	public String getNome() {
		return nome;
	}

	public String getImg() {
		return img;
	}

	public String getInfo() {
		return info;
	}

	public CategoriaBean(int idCategoria, String nome, String img, String info) {
		super();
		this.idCategoria = idCategoria;
		this.nome = nome;
		this.img = img;
		this.info = info;
	}

	@Override
	public String toString() {
		return "\n CategoriaBean [idCategoria=" + idCategoria + ", nome=" + nome + ", img=" + img + ", info=" + info
				+ "]";
	}

}
