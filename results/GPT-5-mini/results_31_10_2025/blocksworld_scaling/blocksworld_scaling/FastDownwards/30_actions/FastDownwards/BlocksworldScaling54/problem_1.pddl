(define (problem BlocksworldScaling54-problem)
  (:domain multiagent-blocksworld)
  (:objects
    A B C D E F G H I J K L M - block
  )
  (:init
    ;; Typing: which blocks are vowels / consonants
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

    ;; Initial stacks (bottom -> top)
    ;; Stack 1: K I G E L M F  (K on table)
    (ontable K)
    (on I K)
    (on G I)
    (on E G)
    (on L E)
    (on M L)
    (on F M)

    ;; Stack 2: B A C H J D  (B on table)
    (ontable B)
    (on A B)
    (on C A)
    (on H C)
    (on J H)
    (on D J)

    ;; Clear blocks (tops of stacks)
    (clear F)
    (clear D)

    ;; Hand empty invariant for actions
    (handempty)
  )

  ;; Goal: single tower with bottom M on table, then L on M, K on L, J on K, I on J, H on I,
  ;; G on H, F on G, E on F, D on E, C on D, B on C, A on B.
  (:goal
    (and
      (ontable M)
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
    )
  )
)