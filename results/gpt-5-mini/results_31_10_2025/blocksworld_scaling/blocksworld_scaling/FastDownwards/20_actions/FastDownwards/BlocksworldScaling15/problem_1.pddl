(define (problem build_L_with_A_on_top)
  (:domain multiagent-blocks)
  (:objects
    A E I - vowel
    B C D F G H J K L - consonant
  )
  (:init
    ;; initial "on" relations (x is on y)
    (on F E)
    (on J F)
    (on G J)
    (on A G)

    (on B K)

    (on C I)
    (on L C)
    (on H L)

    ;; which blocks are on the table initially
    (ontable E)
    (ontable D)
    (ontable K)
    (ontable I)

    ;; clear = nothing on top of the block
    (clear A)
    (clear D)
    (clear B)
    (clear H)

    ;; Note: all other clear/on/ontable implied false initially and will be achieved by moves.
  )
  (:goal (and
    (ontable L)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)