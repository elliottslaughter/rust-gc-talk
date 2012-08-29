fn pointer_to_freed_memory() -> &int {
    let x = @3;
    return &*x; // Error!
}

fn main () {
    pointer_to_freed_memory();
}
