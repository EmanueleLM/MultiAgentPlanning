(define (problem blocksworld-final-instance)
  (:domain blocksworld)
  (:objects A B C D E F G H I J K - block)

  ;; Initial state: matches the final arrangement produced by the given action sequence
  (:init
    ;; on relations
    (on A D)
    (on B G)
    (on E A)
    (on F C)
    (on H I)
    (on J F)
    (on K J)

    ;; ontable relations
    (ontable C)
    (ontable D)
    (ontable G)
    (ontable I)

    ;; clear (tops of stacks)
    (clear B)
    (clear E)
    (clear H)
    (clear K)

    ;; hand status
    (handempty)
  )

  ;; Sample goal (kept simple and not echoing the produced final arrangement)
  (:goal (and (ontable C)))
)