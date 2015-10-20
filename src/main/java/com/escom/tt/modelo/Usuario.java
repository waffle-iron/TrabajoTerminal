package com.escom.tt.modelo;

import java.util.Date;
import java.util.List;



import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.mapping.Set;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="USUARIO")
public class Usuario {


	@Id
	@Column(name="idUsuarios")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idUsuarios;

	@Column(name="nombreUsuario")
	@NotNull
	@Size(min=1,max=45,message="El nombre de usuario debe tener al menos 5 caracteres y maximo 45")
	private String nombreUsuario;

	@Column(name="password")
	@NotNull

	private String password;

	@Column(name="nombres")
	@NotNull
	@Size(min=1,max=45,message="Los nombres deben tener al menos 5 caracteres y maximo 45")
	private String nombres;

	@Column(name="aPaterno")
	@NotNull
	@Size(min=1,max=45,message="El apellido paterno debe tener al menos 5 caracteres y maximo 45")
	private String aPaterno;

	@Column(name="aMaterno")
	@NotNull
	@Size(min=1,max=45,message="El apellido materno debe tener al menos 5 caracteres y maximo 45")
	private String aMaterno;

	@Column(name="email")
	@NotNull
	@Size(min=1,max=45,message="El email debe tener al menos 5 caracteres y maximo 45")
	private String email;

	@Column(name="fechaNacimiento")
	@NotNull(message = "La fecha de nacimiento debe ser obligatoria")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaNacimiento;

	@Column(name="estadoCivil")
	@NotNull
	@Size(min=1,max=45,message="El estado civil debe tener al menos 5 caracteres y maximo 45")
	private String estadoCivil;

	@Column(name="telefono")
	@NotNull
	@Size(min=10,message="El telefono debe tener al menos 10 digitos")
	private String telefono;

	@Column(name="sexo")
	@NotNull
	@Size(min=1)
	private String sexo;

	@Column(name="fechaIngresoIPN")
	@NotNull(message = "La fecha de ingreso debe ser obligatoria")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaIngresoIPN;


	@Column(name="Evaluacion")
	private Integer evaluacion;

	@Column(name="activo")
	private boolean activo;

	@Column(name="rol")
	private String rol;

	@ManyToOne
	@JoinColumn(name="escuela")
	@NotNull(message="Se necesita una escuela para el registro")
	private Escuela escuela;

	@ManyToOne
	@JoinColumn(name="grado")
	@NotNull(message="Se necesita un grado para el registro")
	private Grado grado;


	@OneToMany(mappedBy = "coordinador",fetch=FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	private List<Proyecto> proyectos;
	
	@ManyToMany
	@JoinTable(name="usuario_has_idiomas",
				joinColumns={@JoinColumn(name="Usuarios_idUsuarios")},
				inverseJoinColumns={@JoinColumn(name="Idiomas_idIdiomas")})
	private List<Idioma> idiomas;

	public List<Idioma> getIdiomas() {
		return idiomas;
	}

	public void setIdiomas(List<Idioma> idiomas) {
		this.idiomas = idiomas;
	}

	public List<Proyecto> getProyectos() {
		return proyectos;
	}

	public void setProyectos(List<Proyecto> proyectos) {
		this.proyectos = proyectos;
	}

	@OneToMany(mappedBy = "usuarioEmisor",fetch=FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<Correo> correos;


	public Integer getEvaluacion() {
		return evaluacion;
	}

	public void setEvaluacion(Integer evaluacion) {
		this.evaluacion = evaluacion;
	}

	@OneToMany(mappedBy="usuario",fetch=FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	private List<ColaboradorProyecto> colaboradorProyectos;

	public List<ColaboradorProyecto> getColaboradorProyectos() {
		return colaboradorProyectos;
	}

	public void setColaboradorProyectos(List<ColaboradorProyecto> colaboradorProyectos) {
		this.colaboradorProyectos = colaboradorProyectos;
	}

	public Integer getIdUsuarios() {
		return idUsuarios;
	}

	public void setIdUsuarios(Integer idUsuarios) {
		this.idUsuarios = idUsuarios;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getaPaterno() {
		return aPaterno;
	}

	public void setaPaterno(String aPaterno) {
		this.aPaterno = aPaterno;
	}

	public String getaMaterno() {
		return aMaterno;
	}


	public void setaMaterno(String aMaterno) {
		this.aMaterno = aMaterno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Date getFechaIngresoIPN() {
		return fechaIngresoIPN;
	}

	public void setFechaIngresoIPN(Date fechaIngresoIPN) {
		this.fechaIngresoIPN = fechaIngresoIPN;
	}

	public Escuela getEscuela() {
		return escuela;
	}

	public void setEscuela(Escuela escuela) {
		this.escuela = escuela;
	}

	public Grado getGrado() {
		return grado;
	}

	public void setGrado(Grado grado) {
		this.grado = grado;
	}

	public List<Correo> getCorreos() {
		return correos;
	}

	public void setCorreos(List<Correo> correos) {
		this.correos = correos;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	@Override
	public String toString() {
		return "Usuario{" +
				"idUsuarios=" + idUsuarios +
				", nombreUsuario='" + nombreUsuario + '\'' +
				", contraseña='" + password + '\'' +
				", nombres='" + nombres + '\'' +
				", aPaterno='" + aPaterno + '\'' +
				", aMaterno='" + aMaterno + '\'' +
				", email='" + email + '\'' +
				", fechaNacimiento=" + fechaNacimiento +
				", estadoCivil='" + estadoCivil + '\'' +
				", telefono='" + telefono + '\'' +
				", sexo='" + sexo + '\'' +
				", fechaIngresoIPN=" + fechaIngresoIPN +
				", evaluacion=" + evaluacion +
				", escuela=" + escuela +
				", grado=" + grado +
				", correos=" + correos +
				'}';
	}
}
