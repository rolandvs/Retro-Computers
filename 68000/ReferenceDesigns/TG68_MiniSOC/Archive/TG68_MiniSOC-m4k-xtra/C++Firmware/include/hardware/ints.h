#ifndef INTS_H
#define INTS_H

void SetIntHandler(short interrupt, void(*handler)());

extern "C" {
	extern void EnableInterrupts();
	extern void DisableInterrupts();
}
#endif
