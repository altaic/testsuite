test('T1969',
     [if_wordsize(32,
          compiler_stats_num_field('peak_megabytes_allocated', 15,
                                                               19)),
                                             # expected value: 15 (x86/Windows)
                                             #                 15 (x86/OS X)
                                             #                 19 (x86/OS X)
      if_wordsize(64,
          compiler_stats_num_field('peak_megabytes_allocated', 26,
                                                               32)),
                                             # expected value: 28 (amd64/Linux)
                                             # expected value: 32 (amd64/Linux)
      if_wordsize(32,
          compiler_stats_num_field('max_bytes_used', 6600000,
                                                     7000000)),
                                   # expected value: 6707308 (x86/OS X)
                                   #                 6694144 (x86/Windows)
      if_wordsize(64,
          compiler_stats_num_field('max_bytes_used',  9000000,
                                                     13000000)),
                                   # expected value: 11404664 (amd64/Linux)
      if_wordsize(32,
          compiler_stats_num_field('bytes allocated', 210000000,
                                                      250000000)),
                                    # expected value: 215582916 (x86/Windows)
                                    #                 221667908 (x86/OS X)
      if_wordsize(64,
          compiler_stats_num_field('bytes allocated', 420000000,
                                                      480000000)),
                                    # expected value: 434845560 (amd64/Linux)
      only_ways(['normal'])
      ],
     compile,
     [''])

# This one tests for the space leak in the native code generator,
# where it holds onto the entire asm output until the end.  The space
# leak reappears from time to time, so it's a good idea to have a test
# for it.  The residency of this test will jump by 10MB to 40MB or so
# on x86-64 if the space leak appears.

# Only run this one if we have an NCG:
if 'optasm' in config.compile_ways:
   conf_3294 = only_ways(['normal'])
else:
   conf_3294 = skip

test('T3294',
     [if_wordsize(32,
          compiler_stats_num_field('max_bytes_used', 14000000,
                                                     19000000)),
                                   # expected value: 17754884 (x86/Linux)
      if_wordsize(64,
          compiler_stats_num_field('max_bytes_used', 28000000,
                                                     34000000)),
                                   # expected value: 32 478 408 (amd64/Linux)
                                   # (but varies a lot, depending on when
                                   # we GC relative to the peak).
      if_wordsize(32,
          compiler_stats_num_field('bytes allocated', 800000000,
                                                      830000000)),
                                    # expected value: 815479800  (x86/Linux)
      if_wordsize(64,
          compiler_stats_num_field('bytes allocated', 1200000000,
                                                      1500000000)),
                                    # expected value: 1357587088 (amd64/Linux)
      conf_3294
      ],
     compile,
     [''])