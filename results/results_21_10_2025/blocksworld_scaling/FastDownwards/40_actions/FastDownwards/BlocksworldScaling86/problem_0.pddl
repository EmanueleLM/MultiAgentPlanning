(define (problem rearrange_two_agents)
  (:domain blocksworld_two_agents)

  (:objects
    J B F E G A H D C I - block
  )

  (:init
    ; Initial stacking (two stacks described)
    (ontable J)
    (on F J)
    (on G F)
    (on A G)
    (on D A)

    (ontable B)
    (on E B)
    (on H E)
    (on C H)
    (on I C)

    ; Top/clear information (tops are D and I)
    (clear D)
    (clear I)

    ; Agent movement capabilities:
    ; Vowel agent can move vowel-labeled blocks (A, E, I)
    (movable-by-vowel A)
    (movable-by-vowel E)
    (movable-by-vowel I)

    ; Consonant agent can move all other blocks
    (movable-by-cons J)
    (movable-by-cons B)
    (movable-by-cons F)
    (movable-by-cons G)
    (movable-by-cons H)
    (movable-by-cons D)
    (movable-by-cons C)
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
    (ontable J)
  ))
)