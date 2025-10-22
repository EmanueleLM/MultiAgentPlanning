(define (problem Blocksworld50Instance16-final)
  (:domain blocksworld)
  (:objects
    A B C D E F G H I J K L - block
  )
  (:init
    ;; final "on" relationships
    (on K A)
    (on G K)
    (on J G)
    (on D J)
    (on E D)
    (on I E)
    (on L I)

    (on B H)
    (on C B)
    (on F C)

    ;; table bases
    (ontable A)
    (ontable H)

    ;; clear (tops of stacks)
    (clear L)
    (clear F)

    ;; no one is holding anything, hand is empty
    (handempty)
  )
  ;; no explicit rearrangement goal; use trivially satisfiable goal so planner can validate initial state consistency
  (:goal (and))
)