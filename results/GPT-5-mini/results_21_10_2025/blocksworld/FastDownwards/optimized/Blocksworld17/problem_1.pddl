(define (problem blocksworld-multi-problem)
  (:domain blocksworld-multi-agent)
  (:objects
    a b c d e f g h i j k l m n o - block
    table - obj
  )

  (:init
    ;; block membership (redundant with typing but explicit)
    (block a) (block b) (block c) (block d) (block e) (block f) (block g)
    (block h) (block i) (block j) (block k) (block l) (block m) (block n) (block o)

    ;; vowel and consonant classification (enforce agent-specific constraints)
    (vowel a) (vowel e) (vowel i) (vowel o)
    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g)
    (consonant h) (consonant j) (consonant k) (consonant l) (consonant m)
    (consonant n)

    ;; initial "on" configuration (public information)
    ;; Stack 1: m (table) <- h <- g <- l <- b <- o (top)
    (on m table)
    (on h m)
    (on g h)
    (on l g)
    (on b l)
    (on o b)

    ;; Stack 2: k (table) <- n <- a <- j <- f <- c <- i <- e (top)
    (on k table)
    (on n k)
    (on a n)
    (on j a)
    (on f j)
    (on c f)
    (on i c)
    (on e i)

    ;; Stack 3: d (table)
    (on d table)

    ;; clear (top) blocks
    (clear o)
    (clear e)
    (clear d)

    ;; initial agent hand state (consonant agent uses hand model)
    (handempty)
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
    (on o table)
  ))
)