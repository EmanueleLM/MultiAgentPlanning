; Problem: Build the single stack K J I H G F E D C B A (K on the table, J on K, I on J, ..., A on B).
; No additional assumptions were required — the initial stacks are taken exactly from the specification.

(define (problem build_stack_multiagent)
  (:domain blocksworld_multiagent)

  (:objects
    A E I - vowel
    B C D F G H J K - consonant
  )

  (:init
    ; Stack 1 (bottom -> top): J K C F B H E
    (ontable J)
    (on K J)
    (on C K)
    (on F C)
    (on B F)
    (on H B)
    (on E H)

    ; Stack 2 (bottom -> top): G I D A
    (ontable G)
    (on I G)
    (on D I)
    (on A D)

    ; clear = top blocks only
    (clear E)
    (clear A)
  )

  (:goal (and
    (ontable K)
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