(define (problem blocksworld30instance5_problem)
  (:domain blocksworld_with_timed_sequence)

  (:objects
    a b c d e f g h - block
    mover1 mover2 orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 - step
  )

  (:init
    ;; initial on-stack relations (bottom -> top)
    (on a d)
    (on e a)
    (on b e)
    (on c b)
    (on h g)

    ;; blocks on table
    (on-table d)
    (on-table f)
    (on-table g)

    ;; which blocks are clear initially (top of each stack)
    (clear c)
    (clear f)
    (clear h)

    ;; agents initially free
    (handempty mover1)
    (handempty mover2)
    (handempty orchestrator)

    ;; step 0
    (at-step s0)
  )

  ;; Goal: reach at-step s30 (enforces executing the whole given sequence).
  (:goal (at-step s30))
)