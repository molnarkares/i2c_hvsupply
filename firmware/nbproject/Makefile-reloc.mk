#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-reloc.mk)" "nbproject/Makefile-local-reloc.mk"
include nbproject/Makefile-local-reloc.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=reloc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=tmr3.c pin_manager.c mcc.c pwm5.c memory.c i2c.c clc1.c clc2.c tmr2.c main.c cmd.c mrtc.c vadjust.c pulsecount.c config.c crc8.c reset.c tmr5.c tmr1.c sleep.c hven.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/tmr3.p1 ${OBJECTDIR}/pin_manager.p1 ${OBJECTDIR}/mcc.p1 ${OBJECTDIR}/pwm5.p1 ${OBJECTDIR}/memory.p1 ${OBJECTDIR}/i2c.p1 ${OBJECTDIR}/clc1.p1 ${OBJECTDIR}/clc2.p1 ${OBJECTDIR}/tmr2.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/cmd.p1 ${OBJECTDIR}/mrtc.p1 ${OBJECTDIR}/vadjust.p1 ${OBJECTDIR}/pulsecount.p1 ${OBJECTDIR}/config.p1 ${OBJECTDIR}/crc8.p1 ${OBJECTDIR}/reset.p1 ${OBJECTDIR}/tmr5.p1 ${OBJECTDIR}/tmr1.p1 ${OBJECTDIR}/sleep.p1 ${OBJECTDIR}/hven.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/tmr3.p1.d ${OBJECTDIR}/pin_manager.p1.d ${OBJECTDIR}/mcc.p1.d ${OBJECTDIR}/pwm5.p1.d ${OBJECTDIR}/memory.p1.d ${OBJECTDIR}/i2c.p1.d ${OBJECTDIR}/clc1.p1.d ${OBJECTDIR}/clc2.p1.d ${OBJECTDIR}/tmr2.p1.d ${OBJECTDIR}/main.p1.d ${OBJECTDIR}/cmd.p1.d ${OBJECTDIR}/mrtc.p1.d ${OBJECTDIR}/vadjust.p1.d ${OBJECTDIR}/pulsecount.p1.d ${OBJECTDIR}/config.p1.d ${OBJECTDIR}/crc8.p1.d ${OBJECTDIR}/reset.p1.d ${OBJECTDIR}/tmr5.p1.d ${OBJECTDIR}/tmr1.p1.d ${OBJECTDIR}/sleep.p1.d ${OBJECTDIR}/hven.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/tmr3.p1 ${OBJECTDIR}/pin_manager.p1 ${OBJECTDIR}/mcc.p1 ${OBJECTDIR}/pwm5.p1 ${OBJECTDIR}/memory.p1 ${OBJECTDIR}/i2c.p1 ${OBJECTDIR}/clc1.p1 ${OBJECTDIR}/clc2.p1 ${OBJECTDIR}/tmr2.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/cmd.p1 ${OBJECTDIR}/mrtc.p1 ${OBJECTDIR}/vadjust.p1 ${OBJECTDIR}/pulsecount.p1 ${OBJECTDIR}/config.p1 ${OBJECTDIR}/crc8.p1 ${OBJECTDIR}/reset.p1 ${OBJECTDIR}/tmr5.p1 ${OBJECTDIR}/tmr1.p1 ${OBJECTDIR}/sleep.p1 ${OBJECTDIR}/hven.p1

# Source Files
SOURCEFILES=tmr3.c pin_manager.c mcc.c pwm5.c memory.c i2c.c clc1.c clc2.c tmr2.c main.c cmd.c mrtc.c vadjust.c pulsecount.c config.c crc8.c reset.c tmr5.c tmr1.c sleep.c hven.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-reloc.mk dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16LF1764
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/tmr3.p1: tmr3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tmr3.p1.d 
	@${RM} ${OBJECTDIR}/tmr3.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/tmr3.p1 tmr3.c 
	@-${MV} ${OBJECTDIR}/tmr3.d ${OBJECTDIR}/tmr3.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/tmr3.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pin_manager.p1: pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/pin_manager.p1 pin_manager.c 
	@-${MV} ${OBJECTDIR}/pin_manager.d ${OBJECTDIR}/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc.p1: mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/mcc.p1 mcc.c 
	@-${MV} ${OBJECTDIR}/mcc.d ${OBJECTDIR}/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pwm5.p1: pwm5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pwm5.p1.d 
	@${RM} ${OBJECTDIR}/pwm5.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/pwm5.p1 pwm5.c 
	@-${MV} ${OBJECTDIR}/pwm5.d ${OBJECTDIR}/pwm5.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pwm5.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/memory.p1: memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/memory.p1.d 
	@${RM} ${OBJECTDIR}/memory.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/memory.p1 memory.c 
	@-${MV} ${OBJECTDIR}/memory.d ${OBJECTDIR}/memory.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/memory.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/i2c.p1: i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.p1.d 
	@${RM} ${OBJECTDIR}/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/i2c.p1 i2c.c 
	@-${MV} ${OBJECTDIR}/i2c.d ${OBJECTDIR}/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/clc1.p1: clc1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/clc1.p1.d 
	@${RM} ${OBJECTDIR}/clc1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/clc1.p1 clc1.c 
	@-${MV} ${OBJECTDIR}/clc1.d ${OBJECTDIR}/clc1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/clc1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/clc2.p1: clc2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/clc2.p1.d 
	@${RM} ${OBJECTDIR}/clc2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/clc2.p1 clc2.c 
	@-${MV} ${OBJECTDIR}/clc2.d ${OBJECTDIR}/clc2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/clc2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/tmr2.p1: tmr2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tmr2.p1.d 
	@${RM} ${OBJECTDIR}/tmr2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/tmr2.p1 tmr2.c 
	@-${MV} ${OBJECTDIR}/tmr2.d ${OBJECTDIR}/tmr2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/tmr2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/cmd.p1: cmd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cmd.p1.d 
	@${RM} ${OBJECTDIR}/cmd.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/cmd.p1 cmd.c 
	@-${MV} ${OBJECTDIR}/cmd.d ${OBJECTDIR}/cmd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/cmd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mrtc.p1: mrtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mrtc.p1.d 
	@${RM} ${OBJECTDIR}/mrtc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/mrtc.p1 mrtc.c 
	@-${MV} ${OBJECTDIR}/mrtc.d ${OBJECTDIR}/mrtc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mrtc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/vadjust.p1: vadjust.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/vadjust.p1.d 
	@${RM} ${OBJECTDIR}/vadjust.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/vadjust.p1 vadjust.c 
	@-${MV} ${OBJECTDIR}/vadjust.d ${OBJECTDIR}/vadjust.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/vadjust.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pulsecount.p1: pulsecount.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pulsecount.p1.d 
	@${RM} ${OBJECTDIR}/pulsecount.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/pulsecount.p1 pulsecount.c 
	@-${MV} ${OBJECTDIR}/pulsecount.d ${OBJECTDIR}/pulsecount.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pulsecount.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/config.p1: config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.p1.d 
	@${RM} ${OBJECTDIR}/config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/config.p1 config.c 
	@-${MV} ${OBJECTDIR}/config.d ${OBJECTDIR}/config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/crc8.p1: crc8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/crc8.p1.d 
	@${RM} ${OBJECTDIR}/crc8.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/crc8.p1 crc8.c 
	@-${MV} ${OBJECTDIR}/crc8.d ${OBJECTDIR}/crc8.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/crc8.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/reset.p1: reset.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/reset.p1.d 
	@${RM} ${OBJECTDIR}/reset.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/reset.p1 reset.c 
	@-${MV} ${OBJECTDIR}/reset.d ${OBJECTDIR}/reset.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/reset.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/tmr5.p1: tmr5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tmr5.p1.d 
	@${RM} ${OBJECTDIR}/tmr5.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/tmr5.p1 tmr5.c 
	@-${MV} ${OBJECTDIR}/tmr5.d ${OBJECTDIR}/tmr5.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/tmr5.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/tmr1.p1: tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tmr1.p1.d 
	@${RM} ${OBJECTDIR}/tmr1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/tmr1.p1 tmr1.c 
	@-${MV} ${OBJECTDIR}/tmr1.d ${OBJECTDIR}/tmr1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/tmr1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/sleep.p1: sleep.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sleep.p1.d 
	@${RM} ${OBJECTDIR}/sleep.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/sleep.p1 sleep.c 
	@-${MV} ${OBJECTDIR}/sleep.d ${OBJECTDIR}/sleep.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/sleep.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hven.p1: hven.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hven.p1.d 
	@${RM} ${OBJECTDIR}/hven.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hven.p1 hven.c 
	@-${MV} ${OBJECTDIR}/hven.d ${OBJECTDIR}/hven.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hven.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/tmr3.p1: tmr3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tmr3.p1.d 
	@${RM} ${OBJECTDIR}/tmr3.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/tmr3.p1 tmr3.c 
	@-${MV} ${OBJECTDIR}/tmr3.d ${OBJECTDIR}/tmr3.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/tmr3.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pin_manager.p1: pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/pin_manager.p1 pin_manager.c 
	@-${MV} ${OBJECTDIR}/pin_manager.d ${OBJECTDIR}/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc.p1: mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/mcc.p1 mcc.c 
	@-${MV} ${OBJECTDIR}/mcc.d ${OBJECTDIR}/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pwm5.p1: pwm5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pwm5.p1.d 
	@${RM} ${OBJECTDIR}/pwm5.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/pwm5.p1 pwm5.c 
	@-${MV} ${OBJECTDIR}/pwm5.d ${OBJECTDIR}/pwm5.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pwm5.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/memory.p1: memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/memory.p1.d 
	@${RM} ${OBJECTDIR}/memory.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/memory.p1 memory.c 
	@-${MV} ${OBJECTDIR}/memory.d ${OBJECTDIR}/memory.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/memory.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/i2c.p1: i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.p1.d 
	@${RM} ${OBJECTDIR}/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/i2c.p1 i2c.c 
	@-${MV} ${OBJECTDIR}/i2c.d ${OBJECTDIR}/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/clc1.p1: clc1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/clc1.p1.d 
	@${RM} ${OBJECTDIR}/clc1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/clc1.p1 clc1.c 
	@-${MV} ${OBJECTDIR}/clc1.d ${OBJECTDIR}/clc1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/clc1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/clc2.p1: clc2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/clc2.p1.d 
	@${RM} ${OBJECTDIR}/clc2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/clc2.p1 clc2.c 
	@-${MV} ${OBJECTDIR}/clc2.d ${OBJECTDIR}/clc2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/clc2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/tmr2.p1: tmr2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tmr2.p1.d 
	@${RM} ${OBJECTDIR}/tmr2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/tmr2.p1 tmr2.c 
	@-${MV} ${OBJECTDIR}/tmr2.d ${OBJECTDIR}/tmr2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/tmr2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/cmd.p1: cmd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cmd.p1.d 
	@${RM} ${OBJECTDIR}/cmd.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/cmd.p1 cmd.c 
	@-${MV} ${OBJECTDIR}/cmd.d ${OBJECTDIR}/cmd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/cmd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mrtc.p1: mrtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mrtc.p1.d 
	@${RM} ${OBJECTDIR}/mrtc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/mrtc.p1 mrtc.c 
	@-${MV} ${OBJECTDIR}/mrtc.d ${OBJECTDIR}/mrtc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mrtc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/vadjust.p1: vadjust.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/vadjust.p1.d 
	@${RM} ${OBJECTDIR}/vadjust.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/vadjust.p1 vadjust.c 
	@-${MV} ${OBJECTDIR}/vadjust.d ${OBJECTDIR}/vadjust.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/vadjust.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pulsecount.p1: pulsecount.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pulsecount.p1.d 
	@${RM} ${OBJECTDIR}/pulsecount.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/pulsecount.p1 pulsecount.c 
	@-${MV} ${OBJECTDIR}/pulsecount.d ${OBJECTDIR}/pulsecount.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pulsecount.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/config.p1: config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.p1.d 
	@${RM} ${OBJECTDIR}/config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/config.p1 config.c 
	@-${MV} ${OBJECTDIR}/config.d ${OBJECTDIR}/config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/crc8.p1: crc8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/crc8.p1.d 
	@${RM} ${OBJECTDIR}/crc8.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/crc8.p1 crc8.c 
	@-${MV} ${OBJECTDIR}/crc8.d ${OBJECTDIR}/crc8.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/crc8.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/reset.p1: reset.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/reset.p1.d 
	@${RM} ${OBJECTDIR}/reset.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/reset.p1 reset.c 
	@-${MV} ${OBJECTDIR}/reset.d ${OBJECTDIR}/reset.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/reset.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/tmr5.p1: tmr5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tmr5.p1.d 
	@${RM} ${OBJECTDIR}/tmr5.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/tmr5.p1 tmr5.c 
	@-${MV} ${OBJECTDIR}/tmr5.d ${OBJECTDIR}/tmr5.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/tmr5.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/tmr1.p1: tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tmr1.p1.d 
	@${RM} ${OBJECTDIR}/tmr1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/tmr1.p1 tmr1.c 
	@-${MV} ${OBJECTDIR}/tmr1.d ${OBJECTDIR}/tmr1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/tmr1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/sleep.p1: sleep.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sleep.p1.d 
	@${RM} ${OBJECTDIR}/sleep.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/sleep.p1 sleep.c 
	@-${MV} ${OBJECTDIR}/sleep.d ${OBJECTDIR}/sleep.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/sleep.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/hven.p1: hven.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hven.p1.d 
	@${RM} ${OBJECTDIR}/hven.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_reloc=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/hven.p1 hven.c 
	@-${MV} ${OBJECTDIR}/hven.d ${OBJECTDIR}/hven.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/hven.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_reloc=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall -std=c99 -gdwarf-3 -mstack=compiled:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.map  -DXPRJ_reloc=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -mrom=400-7ff,800-f7f -Os -fasmfile -flocal -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file --fill=0 -mcodeoffset=400h  -ginhx032 -Wl,--data-init -mkeep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mdownload -mno-stackcall -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/external_smps.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/reloc
	${RM} -r dist/reloc

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
