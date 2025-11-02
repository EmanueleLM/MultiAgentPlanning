(define (problem blocks-final)
  (:domain blocks-world)
  (:objects A B C D E F G H I J - block)
  (:init
    ;; on / ontable facts after actions 1-15
    (ontable A)
    (ontable B)
    (ontable C)
    (ontable D)
    (ontable H)

    (on I C)
    (on G E)
    (on E H)
    (on J D)

    ;; held by the robot after action 15
    (holding F)

    ;; clear facts according to resulting stacks
    (clear A)
    (clear B)
    (clear G)
    (clear J)
    (clear I)
  )
  ;; Goal encodes the same arrangement (planner will see this as already satisfied)
  (:goal
    (and
      (ontable A)
      (ontable B)
      (ontable C)
      (ontable D)
      (ontable H)

      (on I C)
      (on G E)
      (on E H)
      (on J D)

      (holding F)

      (clear A)
      (clear B)
      (clear G)
      (clear J)
      (clear I)
    )
  )
)