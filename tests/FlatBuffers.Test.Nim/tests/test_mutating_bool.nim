import std/unittest
import flatbuffers
import testmutatingbool_generated
import property_generated

suite "TestMutatingBool":

  test "MutatingBool":
    var builder = newBuilder(1024)
    builder.TestMutatingBoolStart()
    builder.TestMutatingBoolAddB(builder.CreateProperty(false))
    let root = builder.TestMutatingBoolEnd()
    builder.Finish(root)

    var test_mutating_bool: TestMutatingBool
    GetRootAs(test_mutating_bool, builder.FinishedBytes(), 0)
    var prop2 = test_mutating_bool.b
    check(prop2.property == false)
    prop2.property = false
    check(prop2.property == false)
    prop2.property = true
    check(prop2.property == true)
