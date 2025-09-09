import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  simplifile.read(path) |> result.map(parse) |> result.replace_error(Nil)
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  simplifile.create_file(path) |> result.replace_error(Nil)
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  simplifile.append(path, email <> "\n") |> result.replace_error(Nil)
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  create_log_file(log_path)
  |> result.then(fn(_) { read_emails(emails_path) })
  |> result.then(fn(mails) {
    mails
    |> list.each(fn(email) {
      send_email(email)
      |> result.then(fn(_) { log_sent_email(log_path, email) })
    })
    |> Ok()
  })
}

fn parse(content: String) -> List(String) {
  content |> string.trim |> string.split("\n")
}
