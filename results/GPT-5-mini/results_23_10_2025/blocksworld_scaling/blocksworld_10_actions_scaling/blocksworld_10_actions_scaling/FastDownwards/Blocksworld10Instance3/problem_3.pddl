(define (problem Blocksworld10Instance3-problem)
  (:domain Blocksworld10Instance3)
  (:objects
    a b c d e f - block
    mover_alpha mover_beta orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )

  (:init
    (on a e)
    (on e f)
    (on f d)
    (ontable b)
    (ontable c)
    (ontable d)
    (clear a)
    (clear b)
    (clear c)
    (handempty mover_alpha)
    (handempty mover_beta)
    (handempty orchestrator)
    (nobody-holding)
    (current s0)
  )

  (:goal (and (current s10)))
)