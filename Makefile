## Cameron Palmer, 19 May 2020
## Primary entry point for PLCO analysis pipeline
## 
include Makefile.config
export
.PHONY: all $(SUPPORTED_METHODS) bgen meta cleaned-chips-by-ancestry ancestry relatedness
all: meta

meta: $(SUPPORTED_METHODS)
	$(MAKE) -C shared-makefiles/Makefile.metal

$(SUPPORTED_METHODS): bgen cleaned-chips-by-ancestry
	$(MAKE) -C shared-makefiles/Makefile.$@

bgen:
	$(MAKE) -C $(BGEN_OUTPUT_DIR)

cleaned-chips-by-ancestry: ancestry
	$(MAKE) -C $(CLEANED_CHIP_OUTPUT_DIR)

ancestry: relatedness
	$(MAKE) -C $(ANCESTRY_OUTPUT_DIR)

relatedness:
	$(MAKE) -C $(RELATEDNESS_OUTPUT_DIR)
