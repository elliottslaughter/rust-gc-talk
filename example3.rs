use std;
import std::par;

fn mangle(name: ~str) -> ~str {
    return fmt!("Hi, %s!", name);
}

fn main() {
    let names = ~[~"Spam", ~"Eggs", ~"Ham"];
    for par::map(names, mangle).each |s| {
        io::println(s);
    }
}
