cobrar2sybil <- function(cmod) {
  smod <- sybil::modelorg(id = cmod@mod_id, name = cmod@mod_name, compartment = cmod@mod_compart)
  smod@S <- cmod@S
  smod@comp_attr <- data.frame()
  smod@mod_desc <- cmod@mod_desc
  smod@mod_key <- paste(sample(letters, size = 2),
                        sample(c(letters, 0:9), size = 8, replace = FALSE),
                        collapse = "", sep = "")
  
  smod@lowbnd <- cmod@lowbnd
  smod@uppbnd <- cmod@uppbnd
  
  smod@react_attr <- cmod@react_attr
  smod@react_id <- cmod@react_id
  smod@react_name <- cmod@react_name
  smod@react_num <- length(smod@react_id)
  smod@react_de <- rep(NA, smod@react_num)
  smod@react_rev <- smod@lowbnd < 0
  smod@react_single <- rep(NA, smod@react_num)
  
  
  smod@met_attr <- cmod@met_attr
  smod@met_comp <- match(cmod@met_comp,cmod@mod_compart)
  smod@met_id <- cmod@met_id
  smod@met_name <- cmod@met_name
  smod@met_num <- length(smod@met_id)
  smod@met_de <- rep(NA, smod@met_num)
  smod@met_single <- rep(NA, smod@met_num)
  
  smod@obj_coef <- cmod@obj_coef
  
  smod@gprRules <- cmod@gprRules
  smod@genes <- cmod@genes
  smod@gpr <- rep("",smod@react_num) # not ideal...
  smod@allGenes <- cmod@allGenes
  
  # not ideal either:
  # smod@rxnGeneMat
  # smod@subSys
  
  return(smod)
}
