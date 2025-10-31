(define (problem Blocksworld30Instance11-problem)
  (:domain blocksworld-multiagent)
  (:objects
    a b c d e f g h i j - block
    robot1 robot2 orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 - step
    table - place
  )
  (:init
    ; Initial stacks: [B,A,G,C], [I,D,H], [E,J], [F]
    (on a b)
    (on g a)
    (on c g)
    (ontable b)

    (on d i)
    (on h d)
    (ontable i)

    (on j e)
    (ontable e)

    (ontable f)

    ; clear (top blocks)
    (clear c)
    (clear h)
    (clear j)
    (clear f)

    ; agents start free
    (handempty robot1)
    (handempty robot2)
    (handempty orchestrator)

    ; starting step marker
    (done s0)
  )
  ; Target: execute the full chronological sequence of actions (s0 -> s30).
  ; This problem is prepared for the Fast Downwards planner.
  (:goal (and (done s30)))
)