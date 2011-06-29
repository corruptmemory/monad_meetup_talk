# Whirlwind intro to Haskell and Monads

This material was developed for a functional language meetup.  The intended audience is supposed to have programming experience for sure, and at least some exposure with a "functional" language: Lisp/Scheme/Clojure/Racket, Scala, SML, etc.  The presentation tries to work through some of the more specific features of Haskell needed to talk about Monads.

## References

It was great putting together this talk, here were my sources of information and various inspirations:

Online:

* [The Haskell website](http://www.haskell.org/): http://www.haskell.org/
* [Real World Haskell](http://book.realworldhaskell.org/read/): http://book.realworldhaskell.org/read/
* [Learn you a Haskell for great good](http://learnyouahaskell.com/): http://learnyouahaskell.com/


Books:

* _My personal favorite:_ [Introduction to Functional Programming using Haskell (2nd Edition)](http://www.amazon.com/Introduction-Functional-Programming-using-Haskell/dp/0134843460)<br>
  Author: Richard Bird<br>
  http://www.amazon.com/Introduction-Functional-Programming-using-Haskell/dp/0134843460
  
Papers:

* _Fantastic:_ [The Essence of Functional Programming](http://homepages.inf.ed.ac.uk/wadler/papers/essence/essence.ps)<br>
  Author: Philip Wadler<br>
  http://homepages.inf.ed.ac.uk/wadler/papers/essence/essence.ps
  
* [The Typeclassopedia](http://www.haskell.org/wikiupload/8/85/TMR-Issue13.pdf)<br>
  Author: Brent Yorgey<br>
  http://www.haskell.org/wikiupload/8/85/TMR-Issue13.pdf