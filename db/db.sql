SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `tt` ;
CREATE SCHEMA IF NOT EXISTS `tt` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `tt` ;

-- -----------------------------------------------------
-- Table `tt`.`NIVEL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`NIVEL` ;

CREATE  TABLE IF NOT EXISTS `tt`.`NIVEL` (
  `idNivel` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idNivel`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`AREA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`AREA` ;

CREATE  TABLE IF NOT EXISTS `tt`.`AREA` (
  `idArea` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idArea`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`ESCUELA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`ESCUELA` ;

CREATE  TABLE IF NOT EXISTS `tt`.`ESCUELA` (
  `idEscuela` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `abreviacion` VARCHAR(45) NULL ,
  `nivel` INT NOT NULL ,
  `area` INT NOT NULL ,
  PRIMARY KEY (`idEscuela`) ,
  INDEX `fk_Escuela_Nivel1_idx` (`nivel` ASC) ,
  INDEX `fk_Escuela_Area1_idx` (`area` ASC) ,
  CONSTRAINT `fk_Escuela_Nivel1`
    FOREIGN KEY (`nivel` )
    REFERENCES `tt`.`NIVEL` (`idNivel` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Escuela_Area1`
    FOREIGN KEY (`area` )
    REFERENCES `tt`.`AREA` (`idArea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`GRADO_ACADEMICO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`GRADO_ACADEMICO` ;

CREATE  TABLE IF NOT EXISTS `tt`.`GRADO_ACADEMICO` (
  `idGrado_academico` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idGrado_academico`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`USUARIO` ;

CREATE  TABLE IF NOT EXISTS `tt`.`USUARIO` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT ,
  `nombreUsuario` VARCHAR(45) NULL ,
  `contraseña` VARCHAR(45) NULL ,
  `nombres` VARCHAR(45) NULL ,
  `aPaterno` VARCHAR(45) NULL ,
  `aMaterno` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `fechaNacimiento` DATE NULL ,
  `estadoCivil` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `sexo` VARCHAR(45) NULL ,
  `fechaIngresoIPN` DATE NULL ,
  `calificacion` INT NULL ,
  `escuela` INT NOT NULL ,
  `grado` INT NOT NULL ,
  PRIMARY KEY (`idUsuarios`) ,
  INDEX `fk_Usuario_Escuela1_idx` (`escuela` ASC) ,
  INDEX `fk_Usuario_Grado_academico1_idx` (`grado` ASC) ,
  CONSTRAINT `fk_Usuario_Escuela1`
    FOREIGN KEY (`escuela` )
    REFERENCES `tt`.`ESCUELA` (`idEscuela` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Grado_academico1`
    FOREIGN KEY (`grado` )
    REFERENCES `tt`.`GRADO_ACADEMICO` (`idGrado_academico` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`TIPO_PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`TIPO_PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `tt`.`TIPO_PROYECTO` (
  `idTipoProyecto` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idTipoProyecto`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`ESTADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`ESTADO` ;

CREATE  TABLE IF NOT EXISTS `tt`.`ESTADO` (
  `idEstado` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idEstado`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `tt`.`PROYECTO` (
  `idProyecto` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` LONGTEXT NULL ,
  `fechaInicio` DATE NULL ,
  `fechaFin` DATE NULL ,
  `privado` TINYINT(1) NULL DEFAULT 0 ,
  `avance` VARCHAR(45) NULL ,
  `tipo` INT NOT NULL ,
  `estado` INT NOT NULL ,
  `coordinador` INT NOT NULL ,
  PRIMARY KEY (`idProyecto`) ,
  INDEX `fk_Proyecto_Usuario1_idx` (`coordinador` ASC) ,
  INDEX `fk_Proyecto_TipoProyecto1_idx` (`tipo` ASC) ,
  INDEX `fk_Proyecto_Estado1_idx` (`estado` ASC) ,
  CONSTRAINT `fk_Proyecto_Usuario1`
    FOREIGN KEY (`coordinador` )
    REFERENCES `tt`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_TipoProyecto1`
    FOREIGN KEY (`tipo` )
    REFERENCES `tt`.`TIPO_PROYECTO` (`idTipoProyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Estado1`
    FOREIGN KEY (`estado` )
    REFERENCES `tt`.`ESTADO` (`idEstado` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`IDIOMA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`IDIOMA` ;

CREATE  TABLE IF NOT EXISTS `tt`.`IDIOMA` (
  `idIdiomas` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idIdiomas`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`USUARIO_COLABORADOR_PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`USUARIO_COLABORADOR_PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `tt`.`USUARIO_COLABORADOR_PROYECTO` (
  `Usuario_idUsuarios` INT NOT NULL ,
  `Proyecto_idProyectos` INT NOT NULL ,
  PRIMARY KEY (`Usuario_idUsuarios`, `Proyecto_idProyectos`) ,
  INDEX `fk_Usuario_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos` ASC) ,
  INDEX `fk_Usuario_has_Proyecto_Usuario1_idx` (`Usuario_idUsuarios` ASC) ,
  CONSTRAINT `fk_Usuario_has_Proyecto_Usuario1`
    FOREIGN KEY (`Usuario_idUsuarios` )
    REFERENCES `tt`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Proyecto_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyectos` )
    REFERENCES `tt`.`PROYECTO` (`idProyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`TAREA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`TAREA` ;

CREATE  TABLE IF NOT EXISTS `tt`.`TAREA` (
  `idTarea` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NULL ,
  `estado` INT NULL ,
  `descripcion` LONGTEXT NULL ,
  `avance` INT NULL ,
  `fechaEntrega` DATE NULL ,
  `usuario` INT NOT NULL ,
  `proyecto` INT NOT NULL ,
  PRIMARY KEY (`idTarea`) ,
  INDEX `fk_TAREA_USUARIO_COLABORADOR_PROYECTO1_idx` (`usuario` ASC, `proyecto` ASC) ,
  CONSTRAINT `fk_TAREA_USUARIO_COLABORADOR_PROYECTO1`
    FOREIGN KEY (`usuario` , `proyecto` )
    REFERENCES `tt`.`USUARIO_COLABORADOR_PROYECTO` (`Usuario_idUsuarios` , `Proyecto_idProyectos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`ENTREGABLE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`ENTREGABLE` ;

CREATE  TABLE IF NOT EXISTS `tt`.`ENTREGABLE` (
  `idEntregable` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `tarea` INT NOT NULL ,
  PRIMARY KEY (`idEntregable`) ,
  INDEX `fk_Entregable_Tarea1_idx` (`tarea` ASC) ,
  CONSTRAINT `fk_Entregable_Tarea1`
    FOREIGN KEY (`tarea` )
    REFERENCES `tt`.`TAREA` (`idTarea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`USUARIO_HAS_IDOMAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`USUARIO_HAS_IDOMAS` ;

CREATE  TABLE IF NOT EXISTS `tt`.`USUARIO_HAS_IDOMAS` (
  `Usuarios_idUsuarios` INT NOT NULL ,
  `Idiomas_idIdiomas` INT NOT NULL ,
  PRIMARY KEY (`Usuarios_idUsuarios`, `Idiomas_idIdiomas`) ,
  INDEX `fk_Usuarios_has_Idiomas_Idiomas1_idx` (`Idiomas_idIdiomas` ASC) ,
  INDEX `fk_Usuarios_has_Idiomas_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) ,
  CONSTRAINT `fk_Usuarios_has_Idiomas_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios` )
    REFERENCES `tt`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Idiomas_Idiomas1`
    FOREIGN KEY (`Idiomas_idIdiomas` )
    REFERENCES `tt`.`IDIOMA` (`idIdiomas` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`AREA_HAS_PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`AREA_HAS_PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `tt`.`AREA_HAS_PROYECTO` (
  `Area_idArea` INT NOT NULL ,
  `Proyecto_idProyectos` INT NOT NULL ,
  PRIMARY KEY (`Area_idArea`, `Proyecto_idProyectos`) ,
  INDEX `fk_Area_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos` ASC) ,
  INDEX `fk_Area_has_Proyecto_Area1_idx` (`Area_idArea` ASC) ,
  CONSTRAINT `fk_Area_has_Proyecto_Area1`
    FOREIGN KEY (`Area_idArea` )
    REFERENCES `tt`.`AREA` (`idArea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Area_has_Proyecto_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyectos` )
    REFERENCES `tt`.`PROYECTO` (`idProyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`PALABRA_CLAVE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`PALABRA_CLAVE` ;

CREATE  TABLE IF NOT EXISTS `tt`.`PALABRA_CLAVE` (
  `idPalabrasClave` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idPalabrasClave`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`PALABRA_CLAVE_HAS_PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`PALABRA_CLAVE_HAS_PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `tt`.`PALABRA_CLAVE_HAS_PROYECTO` (
  `PalabrasClave_idPalabrasClave` INT NOT NULL ,
  `Proyecto_idProyectos` INT NOT NULL ,
  PRIMARY KEY (`PalabrasClave_idPalabrasClave`, `Proyecto_idProyectos`) ,
  INDEX `fk_PalabrasClave_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos` ASC) ,
  INDEX `fk_PalabrasClave_has_Proyecto_PalabrasClave1_idx` (`PalabrasClave_idPalabrasClave` ASC) ,
  CONSTRAINT `fk_PalabrasClave_has_Proyecto_PalabrasClave1`
    FOREIGN KEY (`PalabrasClave_idPalabrasClave` )
    REFERENCES `tt`.`PALABRA_CLAVE` (`idPalabrasClave` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PalabrasClave_has_Proyecto_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyectos` )
    REFERENCES `tt`.`PROYECTO` (`idProyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`INVITACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`INVITACION` ;

CREATE  TABLE IF NOT EXISTS `tt`.`INVITACION` (
  `idInvitacion` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATE NULL ,
  `estado` INT NULL ,
  `usuario` INT NOT NULL ,
  `proyecto` INT NOT NULL ,
  PRIMARY KEY (`idInvitacion`) ,
  INDEX `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1_idx` (`usuario` ASC, `proyecto` ASC) ,
  CONSTRAINT `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1`
    FOREIGN KEY (`usuario` , `proyecto` )
    REFERENCES `tt`.`USUARIO_COLABORADOR_PROYECTO` (`Usuario_idUsuarios` , `Proyecto_idProyectos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`DIRECCION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`DIRECCION` ;

CREATE  TABLE IF NOT EXISTS `tt`.`DIRECCION` (
  `idDireccion` INT NOT NULL AUTO_INCREMENT ,
  `calle` VARCHAR(45) NULL ,
  `numero` INT NULL ,
  `colonia` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  `usuario` INT NOT NULL ,
  PRIMARY KEY (`idDireccion`) ,
  INDEX `fk_DIRECCION_USUARIO1_idx` (`usuario` ASC) ,
  CONSTRAINT `fk_DIRECCION_USUARIO1`
    FOREIGN KEY (`usuario` )
    REFERENCES `tt`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt`.`Correo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tt`.`Correo` ;

CREATE  TABLE IF NOT EXISTS `tt`.`Correo` (
  `idCorreo` INT NOT NULL ,
  `Asunto` VARCHAR(45) NULL ,
  `Contenido` VARCHAR(200) NULL ,
  `EMISOR` INT NOT NULL ,
  `RECEPTOR` INT NOT NULL ,
  PRIMARY KEY (`idCorreo`) ,
  INDEX `fk_Correo_USUARIO1_idx` (`EMISOR` ASC) ,
  INDEX `fk_Correo_USUARIO2_idx` (`RECEPTOR` ASC) ,
  CONSTRAINT `fk_Correo_USUARIO1`
    FOREIGN KEY (`EMISOR` )
    REFERENCES `tt`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Correo_USUARIO2`
    FOREIGN KEY (`RECEPTOR` )
    REFERENCES `tt`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tt` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
