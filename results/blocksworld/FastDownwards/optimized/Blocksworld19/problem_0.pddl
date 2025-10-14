(define (problem stack-vowel-consonant)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ;; supports (initial configuration)
    (on-table G)
    (on-table H)
    (on-table I)
    (on-table A)

    (on L G)
    (on J L)
    (on B J)

    (on C H)
    (on M C)

    (on D I)
    (on F D)

    (on K A)
    (on E K)

    ;; clear = top blocks initially
    (clear B)
    (clear M)
    (clear F)
    (clear E)

    ;; both agents start with empty hands
    (handempty-vowel)
    (handempty-consonant)

    ;; capability constraints (hard constraints): which agent may move which blocks
    (can-vowel A)
    (can-vowel E)
    (can-vowel I)

    (can-consonant B)
    (can-consonant C)
    (can-consonant D)
    (can-consonant F)
    (can-consonant G)
    (can-consonant H)
    (can-consonant J)
    (can-consonant K)
    (can-consonant L)
    (can-consonant M)
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
    (on-table M)
  ))
)