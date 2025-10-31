(define (problem rearrange_two_agents)
  (:domain blocksworld_two_agents)

  (:objects
    J B F E G A H D C I - block
  )

  (:init
    ;; initial stacking as given
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

    ;; clear/top blocks (tops of the two stacks are D and I)
    (clear D)
    (clear I)

    ;; agent movement capabilities
    ;; vowels: A, E, I
    (movable-by-vowel A)
    (movable-by-vowel E)
    (movable-by-vowel I)

    ;; consonants: all other blocks
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