(define (problem blocks-final)
  (:domain blocks)
  (:objects A B C D E F G H I J K - block)
  (:init
    ;; on relationships (final arrangement)
    (on C A)
    (on E C)
    (on I E)
    (on F J)
    (on G F)
    (on D B)

    ;; ontable (bottoms)
    (ontable A)
    (ontable J)
    (ontable B)
    (ontable K)
    (ontable H)

    ;; clear (tops)
    (clear I)
    (clear G)
    (clear D)
    (clear K)
    (clear H)

    ;; non-clear for blocks that have something on them
    ;; (these are implicitly not in the above clear list; explicit negatives are not required)
    ;; hand status
    (handempty)
  )
  ;; Goal does not explicitly re-state the proposed solution; it simply requires the planner to observe
  ;; a normal resting condition (hand empty). The initial state encodes the final arrangement produced above.
  (:goal (and (handempty)))
)