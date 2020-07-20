require 'minitest/autorun'

class WithDockerTest < Minitest::Test
  # Run code before a group of test (see: https://github.com/seattlerb/minitest#how-to-run-code-before-a-group-of-tests)
  SETUP = begin
    `docker-compose build`
  end

  def test_debian_10
    test with: 'debian_10'
  end

  def test_with_ubuntu_18
    test with: 'ubuntu_18.04'
  end

  private

  def test(with:)
    assert_equal `docker-compose run --rm #{with}`.strip, 'wkhtmltopdf 0.12.6 (with patched qt)'
  end
end
