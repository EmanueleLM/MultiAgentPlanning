(define (problem bw-instance-Blocksworld50Instance9)
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

  ;; The goal is to make the verifier action applicable (i.e., reach the exact final arrangement),
  ;; without explicitly listing block relations in the goal. The verify-final-arrangement action
  ;; encodes the final arrangement as its preconditions and produces (solved).
  (:goal (and (solved)))
)