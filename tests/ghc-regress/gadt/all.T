setTestOpts(only_compiler_types(['ghc']))
setTestOpts(only_ways(['normal']));

# In fast mode, we omit all the compile_and_run tests except a couple

test('gadt1', normal, compile, [''])
test('gadt2', skip_if_fast, compile_and_run, [''])
test('gadt3', normal, compile, [''])
test('gadt4', skip_if_fast, compile_and_run, [''])
test('gadt5', skip_if_fast, compile_and_run, [''])
test('gadt6', normal, compile, [''])
test('gadt7', normal, compile, [''])
test('gadt8', normal, compile, [''])
test('gadt9', normal, compile, [''])
test('gadt10', normal, compile_fail, [''])
test('gadt11', normal, compile_fail, [''])
test('gadt13', normal, compile, [''])
test('gadt14', normal, compile, [''])
test('gadt15', normal, compile, [''])
test('gadt16', normal, compile, [''])

test('gadt17',
     extra_clean(['Gadt17_help.hi', 'Gadt17_help.o']),
     run_command,
     ['$MAKE -s --no-print-directory gadt17'])

test('gadt18', normal, compile, [''])
test('gadt19', normal, compile, [''])
test('gadt20', normal, compile, [''])
test('gadt21', normal, compile_fail, [''])
test('gadt22', normal, compile, [''])

test('gadt23',
     extra_clean(['Gadt23_AST.hi', 'Gadt23_AST.o']),
     run_command,
     ['$MAKE -s --no-print-directory gadt23'])

test('gadt24', normal, compile, [''])

test('red-black', normal, compile, [''])
test('type-rep', skip_if_fast, compile_and_run, [''])
test('equal', normal, compile, [''])
test('nbe', normal, compile, [''])
test('while', normal, compile_and_run, [''])
test('rw', normal, compile_fail, [''])
test('lazypat', normal, compile_fail, [''])
test('lazypatok', expect_fail, compile, [''])
test('tc', normal, compile_and_run, [''])
test('arrow', normal, compile, [''])
test('tdpe', normal, compile, [''])
test('Nilsson', skip_if_fast, compile, [''])

if config.fast:
    test('records', normal, compile, [''])
else:
    test('records', normal, compile_and_run, [''])
test('ubx-records', skip_if_fast, compile_and_run, [''])
test('records-fail1', normal, compile_fail, [''])

test('doaitse', normal, compile, [''])
test('josef', normal, compile, [''])

# Interaction of fundeps with GADTs doesn't work well 
test('gadt-fd', expect_broken(345), compile, [''])

test('karl1', normal, compile, [''])
test('karl2', normal, compile, [''])
test('data1', normal, compile, [''])
test('data2', normal, compile, [''])

test('termination', normal, compile, [''])
test('set', normal, compile, [''])
test('scoped', normal, compile, [''])
test('gadt-escape1', normal, compile, [''])

# New ones from Dimitrios

# test('gadt-dim1', normal, compile, [''])
# test('gadt-dim2', normal, compile_fail, [''])
# test('gadt-dim3', normal, compile_fail, [''])
# test('gadt-dim4', normal, compile, [''])
# test('gadt-dim5', normal, compile, [''])
# test('gadt-dim6', normal, compile, [''])
# test('gadt-dim7', normal, compile, [''])
# test('gadt-dim8', normal, compile, [''])
# test('Arith', normal, compile, [''])

test('Session', normal, compile_and_run, [''])
test('CasePrune', normal, compile_and_run, [''])

test('T1999', normal, compile, [''])
test('T1999a', normal, compile, [''])

test('T2587', normal, compile, [''])
test('T2040', normal, compile, [''])
test('T2151', normal, compile, [''])
test('T3013', normal, compile, [''])
test('T3163', normal, compile_fail, [''])
test('gadt25', normal, compile, [''])
test('T3651', normal, compile_fail, [''])
test('T3638', normal, compile, [''])

test('gadtSyntax001', if_compiler_lt('ghc', '7.1', expect_fail), compile, [''])
test('gadtSyntaxFail001', if_compiler_lt('ghc', '7.1', expect_fail), compile_fail, [''])
test('gadtSyntaxFail002', if_compiler_lt('ghc', '7.1', expect_fail), compile_fail, [''])
test('gadtSyntaxFail003', if_compiler_lt('ghc', '7.1', expect_fail), compile_fail, [''])
test('T3169', normal, compile_fail, [''])

