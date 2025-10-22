(define (problem blocks-final-state)
  (:domain blocks-multirobot)
  (:objects
    A B C D E F G H - block
  )
  (:init
    (ontable A)
    (on B A)
    (on E B)
    (on D E)

    (ontable G)
    (on H G)
    (on C H)
    (on F C)

    (clear D)
    (clear F)

    (handempty robot1)
    (handempty robot2)
  )

  (:goal
    (and
      (ontable A)
      (ontable E)
      (ontable G)
      (ontable D)
      (ontable F)

      (on B E)
      (on H G)
      (on C F)

      (clear A)
      (clear B)
      (clear H)
      (clear D)
      (clear C)

      (handempty robot1)
      (handempty robot2)
    )
  )
)