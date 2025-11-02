(define (problem blocks-final-sequence)
  (:domain blocks-world-seq)
  (:objects a b c d e f g h i j - block)

  (:init
    ;; initial stacks according to the specification:
    ;; Stack on table a: a <- i <- c <- j <- d <- g <- h
    (ontable a)
    (on i a)
    (on c i)
    (on j c)
    (on d j)
    (on g d)
    (on h g)

    ;; Stack on table b: b <- f <- e
    (ontable b)
    (on f b)
    (on e f)

    ;; clear facts (tops): h and e are initially clear
    (clear h)
    (clear e)

    ;; both hands empty initially
    (handempty)

    ;; step marker: sequence starts with done0 true (no other done predicates present)
    (done0)
  )

  (:goal (done30))
)