(define (problem blocks-sequence-problem)
  (:domain blocks-world-sequence)
  (:objects
    A B C D E F G - block
    worker1 worker2 orchestrator - agent
  )

  (:init
    (on A C)
    (on C G)
    (on E A)
    (on F E)
    (on D B)

    (ontable B)
    (ontable G)

    (clear F)
    (clear D)

    (handempty worker1)
    (handempty worker2)
    (handempty orchestrator)

    (s0)

    ;; identity facts so domain actions specialize to the intended blocks
    (isA A) (isB B) (isC C) (isD D) (isE E) (isF F) (isG G)
  )

  (:goal (done))
)