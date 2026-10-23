#!/bin/bash
# Runs on every prompt: makes Claude apply the plain-reply skill to its answer.
echo "Before replying, apply the plain-reply rules:"
sed -n '/^## What changed/,$p' "$(dirname "$0")/SKILL.md"
