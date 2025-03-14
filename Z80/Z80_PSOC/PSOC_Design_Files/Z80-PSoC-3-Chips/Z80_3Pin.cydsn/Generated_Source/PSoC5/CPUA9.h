/*******************************************************************************
* File Name: CPUA9.h  
* Version 2.20
*
* Description:
*  This file contains Pin function prototypes and register defines
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_CPUA9_H) /* Pins CPUA9_H */
#define CY_PINS_CPUA9_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "CPUA9_aliases.h"

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 CPUA9__PORT == 15 && ((CPUA9__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

/**
* \addtogroup group_general
* @{
*/
void    CPUA9_Write(uint8 value);
void    CPUA9_SetDriveMode(uint8 mode);
uint8   CPUA9_ReadDataReg(void);
uint8   CPUA9_Read(void);
void    CPUA9_SetInterruptMode(uint16 position, uint16 mode);
uint8   CPUA9_ClearInterrupt(void);
/** @} general */

/***************************************
*           API Constants        
***************************************/
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup driveMode Drive mode constants
     * \brief Constants to be passed as "mode" parameter in the CPUA9_SetDriveMode() function.
     *  @{
     */
        #define CPUA9_DM_ALG_HIZ         PIN_DM_ALG_HIZ
        #define CPUA9_DM_DIG_HIZ         PIN_DM_DIG_HIZ
        #define CPUA9_DM_RES_UP          PIN_DM_RES_UP
        #define CPUA9_DM_RES_DWN         PIN_DM_RES_DWN
        #define CPUA9_DM_OD_LO           PIN_DM_OD_LO
        #define CPUA9_DM_OD_HI           PIN_DM_OD_HI
        #define CPUA9_DM_STRONG          PIN_DM_STRONG
        #define CPUA9_DM_RES_UPDWN       PIN_DM_RES_UPDWN
    /** @} driveMode */
/** @} group_constants */
    
/* Digital Port Constants */
#define CPUA9_MASK               CPUA9__MASK
#define CPUA9_SHIFT              CPUA9__SHIFT
#define CPUA9_WIDTH              1u

/* Interrupt constants */
#if defined(CPUA9__INTSTAT)
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in CPUA9_SetInterruptMode() function.
     *  @{
     */
        #define CPUA9_INTR_NONE      (uint16)(0x0000u)
        #define CPUA9_INTR_RISING    (uint16)(0x0001u)
        #define CPUA9_INTR_FALLING   (uint16)(0x0002u)
        #define CPUA9_INTR_BOTH      (uint16)(0x0003u) 
    /** @} intrMode */
/** @} group_constants */

    #define CPUA9_INTR_MASK      (0x01u) 
#endif /* (CPUA9__INTSTAT) */


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define CPUA9_PS                     (* (reg8 *) CPUA9__PS)
/* Data Register */
#define CPUA9_DR                     (* (reg8 *) CPUA9__DR)
/* Port Number */
#define CPUA9_PRT_NUM                (* (reg8 *) CPUA9__PRT) 
/* Connect to Analog Globals */                                                  
#define CPUA9_AG                     (* (reg8 *) CPUA9__AG)                       
/* Analog MUX bux enable */
#define CPUA9_AMUX                   (* (reg8 *) CPUA9__AMUX) 
/* Bidirectional Enable */                                                        
#define CPUA9_BIE                    (* (reg8 *) CPUA9__BIE)
/* Bit-mask for Aliased Register Access */
#define CPUA9_BIT_MASK               (* (reg8 *) CPUA9__BIT_MASK)
/* Bypass Enable */
#define CPUA9_BYP                    (* (reg8 *) CPUA9__BYP)
/* Port wide control signals */                                                   
#define CPUA9_CTL                    (* (reg8 *) CPUA9__CTL)
/* Drive Modes */
#define CPUA9_DM0                    (* (reg8 *) CPUA9__DM0) 
#define CPUA9_DM1                    (* (reg8 *) CPUA9__DM1)
#define CPUA9_DM2                    (* (reg8 *) CPUA9__DM2) 
/* Input Buffer Disable Override */
#define CPUA9_INP_DIS                (* (reg8 *) CPUA9__INP_DIS)
/* LCD Common or Segment Drive */
#define CPUA9_LCD_COM_SEG            (* (reg8 *) CPUA9__LCD_COM_SEG)
/* Enable Segment LCD */
#define CPUA9_LCD_EN                 (* (reg8 *) CPUA9__LCD_EN)
/* Slew Rate Control */
#define CPUA9_SLW                    (* (reg8 *) CPUA9__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define CPUA9_PRTDSI__CAPS_SEL       (* (reg8 *) CPUA9__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define CPUA9_PRTDSI__DBL_SYNC_IN    (* (reg8 *) CPUA9__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define CPUA9_PRTDSI__OE_SEL0        (* (reg8 *) CPUA9__PRTDSI__OE_SEL0) 
#define CPUA9_PRTDSI__OE_SEL1        (* (reg8 *) CPUA9__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define CPUA9_PRTDSI__OUT_SEL0       (* (reg8 *) CPUA9__PRTDSI__OUT_SEL0) 
#define CPUA9_PRTDSI__OUT_SEL1       (* (reg8 *) CPUA9__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define CPUA9_PRTDSI__SYNC_OUT       (* (reg8 *) CPUA9__PRTDSI__SYNC_OUT) 

/* SIO registers */
#if defined(CPUA9__SIO_CFG)
    #define CPUA9_SIO_HYST_EN        (* (reg8 *) CPUA9__SIO_HYST_EN)
    #define CPUA9_SIO_REG_HIFREQ     (* (reg8 *) CPUA9__SIO_REG_HIFREQ)
    #define CPUA9_SIO_CFG            (* (reg8 *) CPUA9__SIO_CFG)
    #define CPUA9_SIO_DIFF           (* (reg8 *) CPUA9__SIO_DIFF)
#endif /* (CPUA9__SIO_CFG) */

/* Interrupt Registers */
#if defined(CPUA9__INTSTAT)
    #define CPUA9_INTSTAT            (* (reg8 *) CPUA9__INTSTAT)
    #define CPUA9_SNAP               (* (reg8 *) CPUA9__SNAP)
    
	#define CPUA9_0_INTTYPE_REG 		(* (reg8 *) CPUA9__0__INTTYPE)
#endif /* (CPUA9__INTSTAT) */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_CPUA9_H */


/* [] END OF FILE */
