(define (problem blocks-vc-problem)
  (:domain blocks-vowel-consonant)

  (:objects
    ; vowels
    A E I - vowel
    ; consonants
    B C D F G H J K L M N - consonant
  )

  (:init
    ; initial "on" relations (immediate supports)
    ; Stack 1 bottom-to-top: H B D K J
    (on B H)
    (on D B)
    (on K D)
    (on J K)

    ; Stack 2 bottom-to-top: I L C
    (on L I)
    (on C L)

    ; Stack 3 bottom-to-top: E N A
    (on N E)
    (on A N)

    ; Stack 4 bottom-to-top: M F G
    (on F M)
    (on G F)

    ; which blocks are directly on the table (bottom elements)
    (ontable H)
    (ontable I)
    (ontable E)
    (ontable M)

    ; clear/top facts for blocks that are currently exposed (no block above)
    (clear J)
    (clear C)
    (clear A)
    (clear G)

    ; Note: any block not listed as clear is assumed to have a block above it initially.
  )

  (:goal (and
    ; Desired final tower, bottom N on the table then M,L,K,J,I,H,G,F,E,D,C,B,A above in that order
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
  ))
)