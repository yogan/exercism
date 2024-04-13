import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> rest -> rest
    "[WARNING]: " <> rest -> rest
    "[INFO]: " <> rest -> rest
    _ -> panic as "Invalid log line"
  }
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> _ -> "error"
    "[WARNING]: " <> _ -> "warning"
    "[INFO]: " <> _ -> "info"
    _ -> panic as "invalid log line"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
