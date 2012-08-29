import io::println;

fn main () {
    for [1, 2, 3].each |i| {
        println(i.to_str());
    }
}
