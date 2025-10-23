(define (problem Blocksworld50Instance6-problem)
  (:domain blocksworld)
  (:objects A B C D E F G H I J)
  (:init
    ;; initial stacking (as provided)
    (on A F)
    (on B C)
    (on C E)
    (on E G)
    (on F H)
    (on G D)
    (on H B)
    (on J I)

    ;; blocks on table initially
    (ontable D)
    (ontable I)

    ;; clear tops
    (clear A)
    (clear J)

    ;; hand is initially empty
    (handempty)
  )

  ;; goal encodes the final arrangement derived from the action sequence
  (:goal (and
    (ontable A)
    (on B F)
    (on C H)
    (ontable D)
    (on E G)
    (on F A)
    (on G D)
    (ontable H)
    (ontable I)
    (on J I)
  ))
)