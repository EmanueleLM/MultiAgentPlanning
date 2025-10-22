(define (problem blocksworld30instance5_problem)
  (:domain blocksworld_with_timed_sequence)
  (:objects
    a b c d e f g h - block
    mover1 mover2 orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 - step
  )
  (:init
    (on a d)
    (on e a)
    (on b e)
    (on c b)
    (on h g)
    (on-table d)
    (on-table f)
    (on-table g)
    (clear c)
    (clear f)
    (clear h)
    (handempty mover1)
    (handempty mover2)
    (handempty orchestrator)
    (at-step s0)
  )
  (:goal (at-step s30))
)