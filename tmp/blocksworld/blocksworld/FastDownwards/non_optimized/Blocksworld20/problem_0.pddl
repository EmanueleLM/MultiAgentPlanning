(define (problem build-A-tower)
  (:domain multiagent-blocks)
  (:objects
    ; vowels
    A E I O - vowel
    ; consonants
    B C D F G H J K L M N - consonant
  )
  (:init
    ;; initial table placements
    (on-table E)
    (on-table O)

    ;; initial on relations (stacked as given)
    (on F O)
    (on B F)
    (on C B)
    (on I C)
    (on D I)
    (on H D)
    (on L H)
    (on J L)

    (on M E)
    (on N M)
    (on K N)
    (on A K)
    (on G A)

    ;; clear = top blocks
    (clear J)
    (clear G)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (on-table O)
  ))
)