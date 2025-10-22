(define (problem bw-problem)
  (:domain blocks)
  (:objects A B C D E F G H I J K L M N - block)
  (:init
    ;; initial on relations (from the provided initial arrangement)
    (on A L)
    (on B F)
    (on C M)
    (on D J)
    (on E G)
    (on F I)
    (on H D)
    (on I E)
    (on J A)
    (on K B)
    (on M H)
    (on N C)

    ;; blocks that are on the table initially
    (ontable G)
    (ontable L)

    ;; clear (top) blocks initially
    (clear K)
    (clear N)

    ;; arm state
    (arm-empty)
  )

  (:goal (and
    ;; final arrangement after the full executed action sequence
    (on A L)
    (on B N)
    (on C E)
    (on D J)
    (on E I)
    (on F B)
    (on H C)
    (on I F)
    (on J A)
    (on K G)

    ;; final table locations required
    (ontable G)
    (ontable L)
    (ontable M)
    (ontable N)

    ;; final arm state
    (arm-empty)
  ))
)