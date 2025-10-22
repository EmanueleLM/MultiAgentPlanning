(define (problem blocks-final-state)
  (:domain blocks-multirobot)
  (:objects
    A B C D E F G H - block
    robot1 robot2 - robot
  )
  (:init
    ;; Table bases after executing the provided action sequence
    (ontable A)
    (ontable E)
    (ontable G)
    (ontable D)
    (ontable F)

    ;; On-relations (bottom -> top within stacks)
    (on B E)
    (on H G)
    (on C F)

    ;; Clear (top) blocks in the final state
    (clear A)
    (clear B)
    (clear H)
    (clear D)
    (clear C)

    ;; Robots' hands are empty in the final state
    (handempty robot1)
    (handempty robot2)
  )

  ;; Represent the final arrangement as the planning goal as well
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