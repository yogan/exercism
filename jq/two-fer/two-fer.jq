# You might want to look at:
#
# - the alternative operator:
#   https://jqlang.github.io/jq/manual/v1.7/#alternative-operator
#
# - string interpolation:
#   https://jqlang.github.io/jq/manual/v1.7/#string-interpolation

# With if then else:
# "One for \(if .name == null then "you" else .name end), one for me."

# Shorter with //:
# "One for \(.name // "you"), one for me."

# As pipeline:
.name // "you" | "One for \(.), one for me."
