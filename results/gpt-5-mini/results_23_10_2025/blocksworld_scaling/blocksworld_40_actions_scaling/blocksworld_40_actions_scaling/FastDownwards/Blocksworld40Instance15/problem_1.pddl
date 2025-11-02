(define (problem Blocksworld40Instance15-problem)
  (:domain blocks-world)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; table bottoms
    (ontable A)
    (ontable C)
    (ontable D)
    (ontable G)

    ;; on relations (initial stacks)
    (on I A)
    (on E C)
    (on H D)
    (on F H)
    (on B G)
    (on J B)

    ;; clear blocks (blocks with nothing on top initially)
    (clear I)
    (clear E)
    (clear F)
    (clear J)

    ;; others are not clear implicitly (no atom)
    ;; agent state
    (handempty)
  )

  (:goal (and
    ;; final table bottoms
    (ontable A)
    (ontable D)
    (ontable G)
    (ontable H)

    ;; final on relations to capture final arrangement
    (on B G)
    (on J B)
    (on F J)
    (on E F)
    (on C E)
    (on I H)
  ))
)