/*******************************************************************************
* File Name: MMU4_Addr_1.h  
* Version 1.80
*
* Description:
*  This file containts Control Register function prototypes and register defines
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_CONTROL_REG_MMU4_Addr_1_H) /* CY_CONTROL_REG_MMU4_Addr_1_H */
#define CY_CONTROL_REG_MMU4_Addr_1_H

#include "cyfitter.h"

#if ((CYDEV_CHIP_FAMILY_USED == CYDEV_CHIP_FAMILY_PSOC3) || \
     (CYDEV_CHIP_FAMILY_USED == CYDEV_CHIP_FAMILY_PSOC4) || \
     (CYDEV_CHIP_FAMILY_USED == CYDEV_CHIP_FAMILY_PSOC5))
    #include "cytypes.h"
#else
    #include "syslib/cy_syslib.h"
#endif

    
/***************************************
*     Data Struct Definitions
***************************************/

/* Sleep Mode API Support */
typedef struct
{
    uint8 controlState;

} MMU4_Addr_1_BACKUP_STRUCT;


/***************************************
*         Function Prototypes 
***************************************/

void    MMU4_Addr_1_Write(uint8 control) ;
uint8   MMU4_Addr_1_Read(void) ;

void MMU4_Addr_1_SaveConfig(void) ;
void MMU4_Addr_1_RestoreConfig(void) ;
void MMU4_Addr_1_Sleep(void) ; 
void MMU4_Addr_1_Wakeup(void) ;


/***************************************
*            Registers        
***************************************/

/* Control Register */
#define MMU4_Addr_1_Control        (* (reg8 *) MMU4_Addr_1_Sync_ctrl_reg__CONTROL_REG )
#define MMU4_Addr_1_Control_PTR    (  (reg8 *) MMU4_Addr_1_Sync_ctrl_reg__CONTROL_REG )

#endif /* End CY_CONTROL_REG_MMU4_Addr_1_H */


/* [] END OF FILE */
