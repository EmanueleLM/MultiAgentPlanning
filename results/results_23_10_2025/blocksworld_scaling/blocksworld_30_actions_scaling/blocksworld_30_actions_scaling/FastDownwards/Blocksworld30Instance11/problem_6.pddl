(define (problem blocksworld30instance11-problem)
  (:domain blocksworld-multiagent)
  (:objects
    a b c d e f g h i j - block
    robot1 robot2 orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 - step
  )
  (:init
    ;; initial stacks: [b a g c], [i d h], [e j], [f]
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

    ;; clear top blocks
    (clear c)
    (clear h)
    (clear j)
    (clear f)

    ;; agents: robot1 and robot2 are actors; orchestrator is not
    (agent-actor robot1)
    (agent-actor robot2)

    ;; hands empty initially
    (handempty robot1)
    (handempty robot2)
    (handempty orchestrator)

    ;; no one holding any block initially
    ;; (anyholding) is false by default (not listed)

    ;; step 0 is done; plan must reach done s30
    (done s0)
  )

  (:goal (and
    (done s30)

    ;; final arrangement after the given chronological sequence:
    (on a b)
    (ontable b)

    (on c h)
    (on d c)

    (ontable e)
    (on j e)
    (on h j)

    (ontable i)
    (on f i)
    (on g f)
  ))
)