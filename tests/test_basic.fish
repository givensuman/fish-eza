#!/usr/bin/env fish

set -l plugin_dir (dirname (dirname (status filename)))
source $plugin_dir/conf.d/fish-eza.fish
source $plugin_dir/functions/_ls.fish

# Test 1: Check if eza is installed (required for plugin)
if not command -q eza
    echo "❌ eza is not installed"
    exit 1
end

# Test 2: Test default parameters
set -l default_output (eza --git --icons --group --group-directories-first --time-style=long-iso --color-scale=all .)
set -l wrapped_output (_ls .)
test "$default_output" = "$wrapped_output"
and echo "✅ Default parameters work correctly"
or begin
    echo "❌ Default parameters test failed"
    exit 1
end

# Test 3: Test custom parameters
set -gx eza_params "--long"
set -l custom_output (eza --long .)
set -l wrapped_custom_output (_ls .)
test "$custom_output" = "$wrapped_custom_output"
and echo "✅ Custom parameters work correctly"
or begin
    echo "❌ Custom parameters test failed"
    exit 1
end

# Test 4: Test alias creation
functions -q ls
and echo "✅ ls alias created"
or begin
    echo "❌ ls alias not created"
    exit 1
end

functions -q ll
and echo "✅ ll alias created"
or begin
    echo "❌ ll alias not created"
    exit 1
end

# Cleanup
_fish_eza_uninstall

echo "✅ All basic tests passed"
