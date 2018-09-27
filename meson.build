project('SoftFP', ['c'])

#-----------------------------------------------------------------------------
# The SoftFP library.
#-----------------------------------------------------------------------------

softfp_lib = library('softfp',
                     ['softfp.c',
                      'softfp.h',
                      'softfp_template.h',
                      'softfp_template_icvt.h'],
                     include_directories : include_directories('.'),
                     install : true)

softfp = declare_dependency(link_with : softfp_lib,
                            include_directories : include_directories('.'))


#-----------------------------------------------------------------------------
# Test.
#-----------------------------------------------------------------------------

# The test uses the softfloat library from qemu.
softfloat_lib = library('softfloat',
                        ['softfloat.c',
                         'softfloat.h',
                         'softfloat-macros.h',
                         'softfloat-specialize.h'],
                        include_directories : include_directories('.'))

softfloat = declare_dependency(link_with : softfloat_lib,
                               include_directories : include_directories('.'))

# The softfptest executable.
softfptest = executable('softfptest',
                        ['softfptest.c',
                         'softfptest_template.h'],
                        include_directories: include_directories('.'),
                        dependencies: [softfp, softfloat])

