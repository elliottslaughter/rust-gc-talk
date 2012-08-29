use std;
import io::println;
import std::par::map;

fn expensive_task(name: ~str) -> ~str {
    return fmt!("Hi, %s!", name);
}

fn main () {
    for map(~[~"Spam", ~"Eggs", ~"Ham"],
            expensive_task).each |s| {
        println(s);
    }
}
