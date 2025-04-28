#!/usr/bin/env fish

set -l plugin_dir (dirname (dirname (status filename)))
source $plugin_dir/conf.d/fish-eza.fish
source $plugin_dir/functions/_ls.fish

# Setup test directories
set -l test_dir /tmp/fish_eza_test_(random)
mkdir -p $test_dir/subdir

# Test 1: Check if auto_ls is disabled by default
cd $test_dir
if set -q eza_run_on_cd
    echo "❌ eza_run_on_cd should not be set by default"
    exit 1
else
    echo "✅ eza_run_on_cd not set by default"
end

# Test 2: Test directory tracking with auto_ls enabled
set -g eza_run_on_cd true
set -g _eza_last_dir $PWD

cd subdir
# Simulate fish_postexec event
_auto_ls
set -l new_dir $PWD
test "$_eza_last_dir" = "$new_dir"
and echo "✅ Directory tracking works"
or begin
    echo "❌ Directory tracking failed"
    exit 1
end

# Test 3: Test that _auto_ls doesn't run when staying in same directory
set -g _eza_last_dir $PWD
cd .
_auto_ls
test "$_eza_last_dir" = "$PWD"
and echo "✅ No auto_ls when staying in same directory"
or begin
    echo "❌ Same directory test failed"
    exit 1
end

# Cleanup
cd /tmp
rm -rf $test_dir
_fish_eza_uninstall

echo "✅ All auto_ls tests passed"
