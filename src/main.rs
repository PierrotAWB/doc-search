use walkdir::WalkDir;

fn main() {
    for entry in WalkDir::new(".") {
        let entry = entry.unwrap();
        if !entry.path_is_symlink() {
            let filename = entry.file_name().
                to_str().
                expect("Unable to process filename");
            let parts: Vec<&str> = filename.split('.').collect();

            match parts.last() {
                Some(v) => match *v {
                    "pdf" => println!("{}", entry.path().display()),
                    &_ => ()
                }
                None => ()
            }

        }
    }
}
