SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`NIVEL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`NIVEL` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`NIVEL` (
  `idNivel` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idNivel`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AREA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AREA` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`AREA` (
  `idArea` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idArea`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESCUELA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ESCUELA` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`ESCUELA` (
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
    REFERENCES `mydb`.`NIVEL` (`idNivel` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Escuela_Area1`
    FOREIGN KEY (`area` )
    REFERENCES `mydb`.`AREA` (`idArea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GRADO_ACADEMICO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`GRADO_ACADEMICO` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`GRADO_ACADEMICO` (
  `idGrado_academico` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idGrado_academico`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DIRECCION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DIRECCION` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`DIRECCION` (
  `idDireccion` INT NOT NULL AUTO_INCREMENT ,
  `calle` VARCHAR(45) NULL ,
  `numero` INT NULL ,
  `colonia` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  PRIMARY KEY (`idDireccion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`USUARIO` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`USUARIO` (
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
  `direccion` INT NOT NULL ,
  PRIMARY KEY (`idUsuarios`) ,
  INDEX `fk_Usuario_Escuela1_idx` (`escuela` ASC) ,
  INDEX `fk_Usuario_Grado_academico1_idx` (`grado` ASC) ,
  INDEX `fk_USUARIO_DIRECCION1_idx` (`direccion` ASC) ,
  CONSTRAINT `fk_Usuario_Escuela1`
    FOREIGN KEY (`escuela` )
    REFERENCES `mydb`.`ESCUELA` (`idEscuela` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Grado_academico1`
    FOREIGN KEY (`grado` )
    REFERENCES `mydb`.`GRADO_ACADEMICO` (`idGrado_academico` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_DIRECCION1`
    FOREIGN KEY (`direccion` )
    REFERENCES `mydb`.`DIRECCION` (`idDireccion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TIPO_PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`TIPO_PROYECTO` (
  `idTipoProyecto` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idTipoProyecto`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESTADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ESTADO` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`ESTADO` (
  `idEstado` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idEstado`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`PROYECTO` (
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
    REFERENCES `mydb`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_TipoProyecto1`
    FOREIGN KEY (`tipo` )
    REFERENCES `mydb`.`TIPO_PROYECTO` (`idTipoProyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Estado1`
    FOREIGN KEY (`estado` )
    REFERENCES `mydb`.`ESTADO` (`idEstado` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`IDIOMA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`IDIOMA` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`IDIOMA` (
  `idIdiomas` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idIdiomas`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USUARIO_COLABORADOR_PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`USUARIO_COLABORADOR_PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`USUARIO_COLABORADOR_PROYECTO` (
  `Usuario_idUsuarios` INT NOT NULL ,
  `Proyecto_idProyectos` INT NOT NULL ,
  PRIMARY KEY (`Usuario_idUsuarios`, `Proyecto_idProyectos`) ,
  INDEX `fk_Usuario_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos` ASC) ,
  INDEX `fk_Usuario_has_Proyecto_Usuario1_idx` (`Usuario_idUsuarios` ASC) ,
  CONSTRAINT `fk_Usuario_has_Proyecto_Usuario1`
    FOREIGN KEY (`Usuario_idUsuarios` )
    REFERENCES `mydb`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Proyecto_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyectos` )
    REFERENCES `mydb`.`PROYECTO` (`idProyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TAREA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TAREA` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`TAREA` (
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
    REFERENCES `mydb`.`USUARIO_COLABORADOR_PROYECTO` (`Usuario_idUsuarios` , `Proyecto_idProyectos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ENTREGABLE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ENTREGABLE` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`ENTREGABLE` (
  `idEntregable` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `tarea` INT NOT NULL ,
  PRIMARY KEY (`idEntregable`) ,
  INDEX `fk_Entregable_Tarea1_idx` (`tarea` ASC) ,
  CONSTRAINT `fk_Entregable_Tarea1`
    FOREIGN KEY (`tarea` )
    REFERENCES `mydb`.`TAREA` (`idTarea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USUARIO_HAS_IDOMAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`USUARIO_HAS_IDOMAS` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`USUARIO_HAS_IDOMAS` (
  `Usuarios_idUsuarios` INT NOT NULL ,
  `Idiomas_idIdiomas` INT NOT NULL ,
  PRIMARY KEY (`Usuarios_idUsuarios`, `Idiomas_idIdiomas`) ,
  INDEX `fk_Usuarios_has_Idiomas_Idiomas1_idx` (`Idiomas_idIdiomas` ASC) ,
  INDEX `fk_Usuarios_has_Idiomas_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) ,
  CONSTRAINT `fk_Usuarios_has_Idiomas_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios` )
    REFERENCES `mydb`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Idiomas_Idiomas1`
    FOREIGN KEY (`Idiomas_idIdiomas` )
    REFERENCES `mydb`.`IDIOMA` (`idIdiomas` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AREA_HAS_PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AREA_HAS_PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`AREA_HAS_PROYECTO` (
  `Area_idArea` INT NOT NULL ,
  `Proyecto_idProyectos` INT NOT NULL ,
  PRIMARY KEY (`Area_idArea`, `Proyecto_idProyectos`) ,
  INDEX `fk_Area_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos` ASC) ,
  INDEX `fk_Area_has_Proyecto_Area1_idx` (`Area_idArea` ASC) ,
  CONSTRAINT `fk_Area_has_Proyecto_Area1`
    FOREIGN KEY (`Area_idArea` )
    REFERENCES `mydb`.`AREA` (`idArea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Area_has_Proyecto_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyectos` )
    REFERENCES `mydb`.`PROYECTO` (`idProyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PALABRA_CLAVE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PALABRA_CLAVE` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`PALABRA_CLAVE` (
  `idPalabrasClave` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idPalabrasClave`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PALABRA_CLAVE_HAS_PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PALABRA_CLAVE_HAS_PROYECTO` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`PALABRA_CLAVE_HAS_PROYECTO` (
  `PalabrasClave_idPalabrasClave` INT NOT NULL ,
  `Proyecto_idProyectos` INT NOT NULL ,
  PRIMARY KEY (`PalabrasClave_idPalabrasClave`, `Proyecto_idProyectos`) ,
  INDEX `fk_PalabrasClave_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos` ASC) ,
  INDEX `fk_PalabrasClave_has_Proyecto_PalabrasClave1_idx` (`PalabrasClave_idPalabrasClave` ASC) ,
  CONSTRAINT `fk_PalabrasClave_has_Proyecto_PalabrasClave1`
    FOREIGN KEY (`PalabrasClave_idPalabrasClave` )
    REFERENCES `mydb`.`PALABRA_CLAVE` (`idPalabrasClave` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PalabrasClave_has_Proyecto_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyectos` )
    REFERENCES `mydb`.`PROYECTO` (`idProyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INVITACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`INVITACION` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`INVITACION` (
  `idInvitacion` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATE NULL ,
  `estado` INT NULL ,
  `usuario` INT NOT NULL ,
  `proyecto` INT NOT NULL ,
  PRIMARY KEY (`idInvitacion`) ,
  INDEX `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1_idx` (`usuario` ASC, `proyecto` ASC) ,
  CONSTRAINT `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1`
    FOREIGN KEY (`usuario` , `proyecto` )
    REFERENCES `mydb`.`USUARIO_COLABORADOR_PROYECTO` (`Usuario_idUsuarios` , `Proyecto_idProyectos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Correo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Correo` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Correo` (
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
    REFERENCES `mydb`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Correo_USUARIO2`
    FOREIGN KEY (`RECEPTOR` )
    REFERENCES `mydb`.`USUARIO` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
