#
# Test failed authentication
#

$:.unshift "../ext/Rpam"
require 'test/unit'
require 'rpam'

class LoadTest < Test::Unit::TestCase
  def test_auth_fail
    assert !Rpam::authpam("","")
    # just return false on unknown user
    assert_nothing_raised { Rpam::authpam("xyzzy", "") }
if false
    if (Process.uid == 0 || (Process.uid==99 && File.exist?("/.buildenv")))
      # raise (if called as non-root) with known user
      assert_nothing_raised { Rpam::authpam("root","root") }
    else
      # raise (if called as non-root) with known user
      assert_raise(SecurityError) { Rpam::authpam("root","root") }
    end
end
  end
end
