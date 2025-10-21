(define (problem integrated-problem)
  (:domain multiagent-blocksworld)
  (:objects
    A B C D E F G H I J K L M N - block
    stack1 stack2 T1 T2 T3 T4 T5 Sg - place
  )

  (:init
    ;; Initial stack1 (bottom -> top): F M K H C G N L
    (on F stack1)
    (on M F)
    (on K M)
    (on H K)
    (on C H)
    (on G C)
    (on N G)
    (on L N)

    ;; Initial stack2 (bottom -> top): D J B E A I
    (on D stack2)
    (on J D)
    (on B J)
    (on E B)
    (on A E)
    (on I A)

    ;; Empty temporary table places and goal stack are initially clear
    (clear T1)
    (clear T2)
    (clear T3)
    (clear T4)
    (clear T5)
    (clear Sg)

    ;; Top blocks of original stacks are clear
    (clear L)
    (clear I)

    ;; Agent-type facts
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)
    (consonant N)

    ;; Mark the goal stack base as fixed so consonant fix actions can anchor on it
    (fixed Sg)
  )

  (:goal (and
    ;; Final single stack on Sg, bottom->top:
    ;; N, M, L, K, J, I, H, G, F, E, D, C, B, A
    (on N Sg)
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
    ;; top must be clear (optional but matches canonical single-stack)
    (clear A)
  ))
)