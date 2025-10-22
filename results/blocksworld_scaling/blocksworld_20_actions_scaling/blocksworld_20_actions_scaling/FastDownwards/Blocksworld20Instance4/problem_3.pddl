(define (problem blocksworld-final-check)
  (:domain blocksworld)
  (:objects A B C D E F G - block
            manipulator1 manipulator2 orchestrator - agent)

  (:init
    (on A G)
    (on B E)
    (on C B)
    (on F D)
    (ontable D)
    (ontable E)
    (on G C)
    (clear A)
    (clear F)
    (handempty manipulator1)
    (handempty manipulator2)
  )

  (:goal
    (and
      (on A G)
      (on G C)
      (on C B)
      (on B E)
      (ontable E)
      (on D F)
      (ontable F)
    )
  )
)