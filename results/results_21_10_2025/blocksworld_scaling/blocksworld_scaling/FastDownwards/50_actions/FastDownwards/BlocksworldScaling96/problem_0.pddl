(define (problem assemble-single-stack)
  (:domain blocks-multiagent)
  (:objects
    ; Agents
    vowel_agent - vowel-agent
    consonant_agent - consonant-agent

    ; Vowel blocks
    A E I - vowel-block

    ; Consonant blocks
    B C D F G H J K L M N - consonant-block
  )

  (:init
    ; Initial stacks (bottom-to-top): [K, H, N, M, J, A], [I, D, B], [G, L, E], [C, F].
    (ontable K)
    (on H K)
    (on N H)
    (on M N)
    (on J M)
    (on A J)
    (clear A)

    (ontable I)
    (on D I)
    (on B D)
    (clear B)

    (ontable G)
    (on L G)
    (on E L)
    (clear E)

    (ontable C)
    (on F C)
    (clear F)

    ; Agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  ; Goal: single stack bottom-to-top: N (on table), M, L, K, J, I, H, G, F, E, D, C, B, A (A topmost)
  (:goal (and
    (ontable N)
    (on M N)
    (on L M)
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
    (clear A)
  ))
)