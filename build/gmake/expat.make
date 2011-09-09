# GNU Make project makefile autogenerated by Premake
ifndef config
  config=release
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),release)
  OBJDIR     = obj/Release/expat
  TARGETDIR  = ../../bin/Release
  TARGET     = $(TARGETDIR)/liblibexpat.so
  DEFINES   += -DNDEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -shared -L../../bin/Release -L../../lib/Release
  LIBS      += -ldl
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CC) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug)
  OBJDIR     = obj/Debug/expat
  TARGETDIR  = ../../bin/Debug
  TARGET     = $(TARGETDIR)/liblibexpat.so
  DEFINES   += -DDEBUG -D_DEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -shared -L../../bin/Debug -L../../lib/Debug
  LIBS      += -ldl
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CC) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/xmlparse.o \
	$(OBJDIR)/xmlrole.o \
	$(OBJDIR)/xmltok.o \
	$(OBJDIR)/xmltok_impl.o \
	$(OBJDIR)/xmltok_ns.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking expat
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning expat
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o $@ -c $<
endif

$(OBJDIR)/xmlparse.o: ../../expat/lib/xmlparse.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o $@ -c $<
$(OBJDIR)/xmlrole.o: ../../expat/lib/xmlrole.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o $@ -c $<
$(OBJDIR)/xmltok.o: ../../expat/lib/xmltok.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o $@ -c $<
$(OBJDIR)/xmltok_impl.o: ../../expat/lib/xmltok_impl.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o $@ -c $<
$(OBJDIR)/xmltok_ns.o: ../../expat/lib/xmltok_ns.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o $@ -c $<

-include $(OBJECTS:%.o=%.d)