#!/bin/sh
input=$(cat)

# -----------------------------------------------------------------------------
# Optimized Claude Code statusline implementation, adapted from Daniel Mackay's
# version at https://www.dandoescode.com/blog/claude-code-custom-statusline
# by Samuel Sydänlammi & ChatGPT with efficiency and info content improvements
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Keep original jq structure (correct field mapping)
# -----------------------------------------------------------------------------
model=$(echo "$input" | jq -r '.model.display_name // "Unknown Model"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
worktree=$(echo "$input" | jq -r '.worktree.name // empty')
total_cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')
current_dir=$(echo "$input" | jq -r '.worktree.original_cwd // empty')
rl_5h_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty' | awk '{printf "%.0f", $1}')
rl_5h_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
rl_7d_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
rl_7d_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# -----------------------------------------------------------------------------
# Context %
# -----------------------------------------------------------------------------
if [ -n "$used" ]; then
  used_display=$(printf "%.0f" "$used")
  usage_str="${used_display}%"
else
  usage_str="0%"
fi

# -----------------------------------------------------------------------------
# Worktree
# -----------------------------------------------------------------------------
if [ -n "$worktree" ]; then
  worktree_str="${worktree}"
else
  worktree_str="no worktree"
fi

# -----------------------------------------------------------------------------
# Colors (unchanged)
# -----------------------------------------------------------------------------
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
RESET='\033[0m'

# -----------------------------------------------------------------------------
# Git (fixed + enhanced)
# -----------------------------------------------------------------------------
git_str="no-git"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git branch --show-current 2>/dev/null)
  [ -z "$branch" ] && branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

  # --- Original signals (keep) ---
  staged=$(git diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
  modified=$(git diff --numstat 2>/dev/null | wc -l | tr -d ' ')

  # "~2" = number of modified files → keep (fast signal)
  mod_str=""
  [ "$modified" -gt 0 ] && mod_str="~${modified}"

  # --- New compact diff (cached) ---
  CACHE_FILE="/tmp/claude_git_diff_cache"
  NOW=$(date +%s)
  TTL=2

  if [ -f "$CACHE_FILE" ]; then
    LAST=$(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)
  else
    LAST=0
  fi

  if [ $((NOW - LAST)) -gt $TTL ]; then
    git diff --shortstat 2>/dev/null > "$CACHE_FILE"
  fi

  stats=$(cat "$CACHE_FILE" 2>/dev/null)

  # Parse: "2 files changed, 5 insertions(+), 11 deletions(-)"
  files=$(echo "$stats" | awk '{print $1}')
  insertions=$(echo "$stats" | grep -o '[0-9]\+ insertion' | awk '{print $1}')
  deletions=$(echo "$stats" | grep -o '[0-9]\+ deletion' | awk '{print $1}')

  [ -z "$files" ] && files=0
  [ -z "$insertions" ] && insertions=0
  [ -z "$deletions" ] && deletions=0

  diff_str=""
  if [ "$files" -gt 0 ] || [ "$insertions" -gt 0 ] || [ "$deletions" -gt 0 ]; then
    diff_str="(${files}+${insertions}-${deletions})"
  fi

  git_str="$branch"
  [ -n "$mod_str" ] && git_str="${git_str} ${mod_str}"
  [ -n "$diff_str" ] && git_str="${git_str} ${diff_str}"

else
  git_str="no-git"
fi

# -----------------------------------------------------------------------------
# Cost (unchanged)
# -----------------------------------------------------------------------------
if [ -n "$total_cost" ]; then
  cost_display=$(awk "BEGIN { printf \"%.2f\", $total_cost }")
  block_str="\$${cost_display}"
else
  block_str="\$0.00"
fi

# -----------------------------------------------------------------------------
# Rate limit (unchanged logic)
# -----------------------------------------------------------------------------
make_bar() {
  pct="$1"
  width=10
  filled=$(( pct * width / 100 ))
  empty=$(( width - filled ))
  bar=""
  i=0
  while [ $i -lt $filled ]; do bar="${bar}█"; i=$(( i + 1 )); done
  while [ $i -lt $width ];  do bar="${bar}░"; i=$(( i + 1 )); done
  printf "%s" "$bar"
}

format_rl() {
  pct="$1"
  reset_ts="$2"
  label="$3"

  if [ -z "$pct" ]; then
    printf "${label} (pending)"
    return
  fi

  now=$(date +%s)
  diff=$((reset_ts - now))
  [ "$diff" -lt 0 ] && diff=0

  # Duration breakdown
  days=$(( diff / 86400 ))
  hours=$(( (diff % 86400) / 3600 ))
  mins=$(( (diff % 3600) / 60 ))

  # Absolute time formats
  time_str=$(date -d "@$reset_ts" "+%H:%M" 2>/dev/null || date -r "$reset_ts" "+%H:%M")

  # Build duration string
  if [ "$days" -gt 0 ]; then
    weekday=$(date -d "@$reset_ts" "+%a" 2>/dev/null || date -r "$reset_ts" "+%a")
    dur="~${days}d${hours}h"
    reset_display="R@ ${weekday} ${time_str} (${dur})"
  else
    dur="~${hours}h${mins}"
    reset_display="R@ ${time_str} (${dur})"
  fi

  # Color logic (unchanged)
  if [ "$pct" -ge 90 ]; then color="$RED"
  elif [ "$pct" -ge 70 ]; then color="$YELLOW"
  else color="$GREEN"
  fi

  bar=$(make_bar "$pct")

  printf "${color}${label} ${bar} ${pct}%% %s${RESET}" "$reset_display"
}

rate_limit_str=""
rate_limit_str="${rate_limit_str}$(format_rl "$rl_5h_pct" "$rl_5h_reset" "5h")"
rate_limit_str="${rate_limit_str} ️️⏱️ $(format_rl "$rl_7d_pct" "$rl_7d_reset" "7d")"

# -----------------------------------------------------------------------------
# Directory (unchanged)
# -----------------------------------------------------------------------------
repo_root=$(cd "$current_dir" 2>/dev/null && git rev-parse --show-toplevel 2>/dev/null || echo "$current_dir")
dir_display=$(basename "$repo_root")

# -----------------------------------------------------------------------------
# FINAL OUTPUT (identical layout)
# -----------------------------------------------------------------------------
printf "🤖 %s | 🧠 %s | 💰 %s | ⏱️ %s\n📁 %s | 🌳 %s | 🌿 %s" \
  "$model" "$usage_str" "$block_str" "$rate_limit_str" \
  "$dir_display" "$worktree_str" "$git_str"
