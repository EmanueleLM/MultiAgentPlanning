(define (problem build-final-stack)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G H I J K L M - block
    table1 table2 table3 - slot
  )

  (:init
    ; type labelling: vowels and consonants
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M)

    ; initial placement on table slots (three table slots used initially)
    (on-slot C table1)
    (on-slot E table2)
    (on-slot K table3)

    ; initial stacks above those table bottoms
    (on H C)          ; Stack1: C - H(top)
    (on I E) (on G I) (on M G) (on D M) (on F D)  ; Stack2: E - I - G - M - D - F(top)
    (on J K) (on L J) (on B L) (on A B)           ; Stack3: K - J - L - B - A(top)

    ; clear predicates: tops of each stack
    (clear H)
    (clear F)
    (clear A)

    ; table slots that are free: none initially (all three occupied)
    ; (no (free table1)) etc. - we simply do not assert free for occupied slots
  )

  (:goal
    (and
      ; final single stack bottom-to-top: M L K J I H G F E D C B A
      ; M must be on a table slot (choose table1 as the designated bottom slot)
      (on-slot M table1)
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