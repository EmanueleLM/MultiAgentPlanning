(define (problem mystery-blocksworld-problem)
  (:domain mystery-blocksworld)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 s6 - step
  )
  (:init
    ;; initial craving relations
    (craves a d)
    (craves c b)

    ;; global harmony initially
    (harmony)

    ;; planets and provinces initially as specified
    (planet b)
    (planet d)
    (province a)
    (province c)

    ;; explicit step chain and current stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (current s0)
  )
  (:goal (and
    (craves b a)
    (craves c b)
    (craves d c)
  ))
)