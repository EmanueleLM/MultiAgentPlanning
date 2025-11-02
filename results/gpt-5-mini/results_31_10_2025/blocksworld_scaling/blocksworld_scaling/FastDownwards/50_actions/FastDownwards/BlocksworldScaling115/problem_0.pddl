(define (problem blocks-problem)
  (:domain blocks-dual-agent)
  (:objects
    A E I - vowel
    B C D F G H J K L - consonant
    vowel_agent - vowel-agent
    consonant_agent - consonant-agent
  )

  (:init
    ;; initial stacks (bottom -> ... -> top)
    ;; S1: B -> A -> L -> C -> E
    (ontable B)
    (on A B)
    (on L A)
    (on C L)
    (on E C)

    ;; S2: I -> G -> D -> K
    (ontable I)
    (on G I)
    (on D G)
    (on K D)

    ;; S3: H -> F -> J
    (ontable H)
    (on F H)
    (on J F)

    ;; clear/top facts
    (clear E)
    (clear K)
    (clear J)

    ;; agents are initially free-handed
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
    ;; final single tower (bottom -> ... -> top):
    ;; L -> K -> J -> I -> H -> G -> F -> E -> D -> C -> B -> A
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
    ;; top should be clear
    (clear A)
  ))
)