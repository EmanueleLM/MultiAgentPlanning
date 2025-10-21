(define (problem stacking-problem)
  (:domain multiagent-blocks)

  (:objects
    s1 s2 - stack

    ; Vowels
    A E I - vowel

    ; Consonants
    B C D F G H J K L M - consonant
  )

  (:init
    ; Initial Stack1 (bottom -> top): H, G, K, B, D, L, I
    (on H s1)
    (on G H)
    (on K G)
    (on B K)
    (on D B)
    (on L D)
    (on I L)
    (top I s1)

    ; Initial Stack2 (bottom -> top): M, F, A, E, J, C
    (on M s2)
    (on F M)
    (on A F)
    (on E A)
    (on J E)
    (on C J)
    (top C s2)

    ; No stack is empty initially (explicit empties absent)
  )

  (:goal (and
    ; Goal is a single stack bottom->top:
    ; M, L, K, J, I, H, G, F, E, D, C, B, A  (with M on the table)
    (on M s2)
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
    (top A s2)
    (empty s1)
  ))
)