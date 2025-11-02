(define (problem blocks-world-sequence-problem)
  (:domain blocks-world-sequence)
  (:objects
    a b c d e f g h - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - step
  )
  (:init
    ;; Initial stacks:
    ;; Stack1: Table -> g -> b -> c -> f -> d (d is top)
    (ontable g)
    (on b g)
    (on c b)
    (on f c)
    (on d f)
    ;; Stack2: Table -> a -> h -> e (e is top)
    (ontable a)
    (on h a)
    (on e h)
    ;; Clear (tops)
    (clear d)
    (clear e)
    ;; Nobody holding anything at start
    (handempty)
    ;; Start step marker
    (done s0)
  )
  (:goal (and
    (done s20)
  ))
)