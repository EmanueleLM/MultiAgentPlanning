(define (problem build-final-stack)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ; typing of vowels and consonants
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M)

    ; initial stacks (Stack1: C - H(top))
    (ontable C)
    (on H C)

    ; initial stacks (Stack2: E - I - G - M - D - F(top))
    (ontable E)
    (on I E)
    (on G I)
    (on M G)
    (on D M)
    (on F D)

    ; initial stacks (Stack3: K - J - L - B - A(top))
    (ontable K)
    (on J K)
    (on L J)
    (on B L)
    (on A B)

    ; clear (tops of each stack)
    (clear H)
    (clear F)
    (clear A)
  )

  (:goal
    (and
      ; final single stack bottom-to-top: M L K J I H G F E D C B A
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
      (clear A)
    )
  )
)