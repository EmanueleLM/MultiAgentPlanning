(define (problem multiagent-tower-a-to-o)
  (:domain multiagent-vowel-consonant)
  (:objects
    ;; vowels (these objects are manipulable by the vowel-agent)
    a e i o - vowel
    ;; consonants (manipulable by the consonant-agent)
    f b c m d n k h l j g - consonant
    ;; Note: vowel and consonant are subtypes of block by domain typing
  )

  (:init
    ;; explicit vowel capability facts (keeps compatibility with vowel-agent fragment)
    (vowel a)
    (vowel e)
    (vowel i)
    (vowel o)

    ;; table supports
    (ontable e)
    (ontable o)

    ;; initial stacks (shared view)
    ;; Stack rooted at o: o <- f <- b <- c <- i <- d <- h <- l <- j (j is top)
    (on f o)
    (on b f)
    (on c b)
    (on i c)
    (on d i)
    (on h d)
    (on l h)
    (on j l)

    ;; Stack rooted at e: e <- m <- n <- k <- a <- g (g is top)
    (on m e)
    (on n m)
    (on k n)
    (on a k)
    (on g a)

    ;; clear (top) blocks initially
    (clear j)
    (clear g)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j k)
    (on k l)
    (on l m)
    (on m n)
    (on n o)
    (ontable o)
  ))
)