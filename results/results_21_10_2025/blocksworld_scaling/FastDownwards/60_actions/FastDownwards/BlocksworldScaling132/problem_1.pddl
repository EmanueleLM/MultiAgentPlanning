(define (problem stacking_vowel_consonant_fd)
  (:domain blocks-vowel-consonant)

  (:objects
    A B C D E F G H I J K L M N - block
  )

  (:init
    ;; initial stacks (bottom -> top)
    ;; stack1: D F C B K N I M G
    (ontable D)
    (on F D)
    (on C F)
    (on B C)
    (on K B)
    (on N K)
    (on I N)
    (on M I)
    (on G M)

    ;; stack2: A H J E L
    (ontable A)
    (on H A)
    (on J H)
    (on E J)
    (on L E)

    ;; top (clear) blocks
    (clear G)
    (clear L)

    ;; control partition: vowels vs consonants
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
    ;; final single chain with bottom N on table: N M L K J I H G F E D C B A
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