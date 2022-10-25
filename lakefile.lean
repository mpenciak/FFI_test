import Lake
open Lake DSL

package FFI 

lean_lib FFI {

}

def importC   := "import.c"
def importO   := "import.o"
def importLib := "import"

target importTarget (pkg : Package) : FilePath := do
  let oFile := pkg.buildDir / importO
  let srcJob ← inputFile <| pkg.dir / importC
  buildFileAfterDep oFile srcJob fun srcFile => do
    let flags := #["-I", (← getLeanIncludeDir).toString, "-fPIC"]
    compileO importC oFile srcFile flags

extern_lib ffi (pkg : Package) := do
  let name := nameToStaticLib importLib
  let ffiO ← fetch <| pkg.target ``importTarget
  buildStaticLib (pkg.buildDir / "lib" / name) #[ffiO]

@[defaultTarget]
lean_exe fFi {
  root := `Main
}
