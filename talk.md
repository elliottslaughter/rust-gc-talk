% High-Performance Garbage Collection in Rust
% Elliott Slaughter \<slaughter@cs.stanford.edu>
% August 30, 2012

# Or, How to Hack LLVM's GC Support to Allow Us to Start Thinking About High-Performance GC in Rust

# Rust in 3 Examples

\begin{itemize}
  \item<alert@2> Fast
  \item<alert@3> Safe
  \item<alert@4> Concurrent
\end{itemize}

\only<2>{

    import io::println;

    fn main () {
        for [1, 2, 3].each |i| {
            println(i.to_str());
        }
    }

}

\only<3>{

    import vec::append_mut;

    fn twiddle(nums: @[int]) {
        append_mut(nums, [4, 5, 6]);
    }

    fn main () {
        let nums = @[1, 2, 3];
        twiddle(nums);
    }

    // Results in this error:
    // safe.rs:4:15: 4:19 error: illegal borrow: creating mutable alias to aliasable, immutable memory
    // safe.rs:4     append_mut(nums, [4, 5, 6]);
    //                          ^~~~

}

\only<4>{

    use std;
    import io::println;
    import std::par::map;

    fn expensive_task(&&name: ~str) -> ~str {
        return fmt!("Hi, %s!", name);
    }

    fn main () {
        for map(~[~"Spam", ~"Eggs", ~"Ham"], expensive_task).each |s| {
            println(s);
        }
    }

}

# Why GC?

  * Rust already has reference-counted types
  * Reference counting might not be as fast as you'd think
  * Secret weapon: Rust's memory model guarrantees isolation

# Doesn't LLVM already support GC?
