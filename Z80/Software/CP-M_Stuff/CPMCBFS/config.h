/* Edited by hand for Windows, from output of configure */
#define HAVE_FCNTL_H 1
#define HAVE_LIMITS_H 0
#define HAVE_UNISTD_H 1
#define HAVE_WINDOWS_H 1
#define HAVE_WINIOCTL_H 0
#define HAVE_LIBDSK_H 0
#define HAVE_SYS_TYPES_H 1
#define HAVE_SYS_STAT_H 1
/* #define HAVE_MODE_T 0 strangely this has to be not defined, not 0 */

#if HAVE_SYS_STAT_H
#include <sys/stat.h>
#endif

#if HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif

#if HAVE_LIMITS_H
#include <limits.h>
#endif

#if HAVE_UNISTD_H
#include <unistd.h>
#endif

#if HAVE_WINDOWS_H
#include <windows.h>
#endif

#if HAVE_WINIOCTL_H
#include <winioctl.h>
#endif

#if HAVE_LIBDSK_H
#include <libdsk.h>
#endif

#if HAVE_FCNTL_H
#include <fcntl.h>
#endif

#ifndef _POSIX_PATH_MAX
#define _POSIX_PATH_MAX _MAX_PATH
#endif

#include <time.h>

/* Define either for large file support, if your OS needs them. */
/* #undef _FILE_OFFSET_BITS */
/* #undef _LARGE_FILES */

/* Define if using dmalloc */
/* #undef USE_DMALLOC */
