(define (problem blocksworld-final-check)
  (:domain blocksworld)
  (:objects A B C D E F G - block)

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
    (handempty)
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