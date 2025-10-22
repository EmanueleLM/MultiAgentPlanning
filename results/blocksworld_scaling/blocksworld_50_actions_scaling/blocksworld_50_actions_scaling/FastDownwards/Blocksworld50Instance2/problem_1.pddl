(define (problem blocks-instance)
  (:domain blocks)
  (:objects
    A B C D E F G H I J K L M - block
  )
  (:init
    ;; initial on relations (as provided)
    (on A K)
    (on K B)
    (on B C)
    (ontable C)

    (on J H)
    (on H F)
    (on F M)
    (on M D)
    (on D E)
    (on E I)
    (on I G)
    (ontable G)

    ;; initial clear blocks (top of stacks)
    (clear L)  ;; L is on A and is top
    (clear J)  ;; J is on H and is top

    ;; other bookkeeping
    (handempty)
  )

  ;; Goal encodes the final arrangement derived from the action sequence
  (:goal (and
    (on A K)
    (on K B)
    (on B C)
    (ontable C)

    (on L A)
    (on J L)
    (on H J)
    (on F H)
    (on M F)
    (on E M)

    (ontable D)
    (ontable G)
    (ontable I)
  ))
)