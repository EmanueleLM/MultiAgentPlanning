(define (problem blocks-final-state)
  (:domain blocks-multirobot)
  (:objects
    A B C D E F G H - block
    robot1 robot2 - robot
  )
  (:init
    ;; Initial stacks (before executing the sequence)
    (ontable A)
    (on B A)
    (on E B)
    (on D E)

    (ontable G)
    (on H G)
    (on C H)
    (on F C)

    ;; Clear (top) blocks initially
    (clear D)
    (clear F)

    ;; Robots' hands empty initially
    (handempty robot1)
    (handempty robot2)
  )

  ;; Goal: verify final arrangement reached (the deduced solution).
  ;; The goal enforces the final positions and handempty status.
  (:goal
    (and
      ;; blocks on the table in final arrangement
      (ontable A)
      (ontable E)
      (ontable G)
      (ontable D)
      (ontable F)

      ;; on-relations in final arrangement
      (on B E)
      (on H G)
      (on C F)

      ;; clear/top blocks in final arrangement
      (clear A)
      (clear B)
      (clear H)
      (clear D)
      (clear C)

      ;; robots should be idle at the end
      (handempty robot1)
      (handempty robot2)
    )
  )
)