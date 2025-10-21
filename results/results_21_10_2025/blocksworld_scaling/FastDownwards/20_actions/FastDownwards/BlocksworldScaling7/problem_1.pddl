(define (problem BlocksworldScaling7-problem)
  (:domain multiagent-blocksworld)

  (:objects
    A B C D E F G H I J K L M N - block
    stack1 stack2 goal t1 t2 t3 t4 t5 t6 t7 t8 t9 - place
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

    ;; Top blocks of the two initial stacks are clear
    (clear L)
    (clear I)

    ;; All temporary table places and the goal place are initially clear
    (clear t1)
    (clear t2)
    (clear t3)
    (clear t4)
    (clear t5)
    (clear t6)
    (clear t7)
    (clear t8)
    (clear t9)
    (clear goal)

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
  )

  (:goal (and
    ;; Final single stack on 'goal' with bottom->top:
    ;; N, M, L, K, J, I, H, G, F, E, D, C, B, A
    (on N goal)
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