(define (problem build-A-on-B-...-on-O)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K L M N O - block
  )
  (:init
    ;; typing / membership
    (block A) (block B) (block C) (block D) (block E) (block F) (block G)
    (block H) (block I) (block J) (block K) (block L) (block M) (block N) (block O)

    ;; vowels: A, E, I, O
    (vowel A) (vowel E) (vowel I) (vowel O)
    ;; consonants: remaining blocks
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M) (consonant N)

    ;; initial: all blocks on the table and clear
    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable G) (clear G)
    (ontable H) (clear H)
    (ontable I) (clear I)
    (ontable J) (clear J)
    (ontable K) (clear K)
    (ontable L) (clear L)
    (ontable M) (clear M)
    (ontable N) (clear N)
    (ontable O) (clear O)

    ;; both agents start with empty hands
    (handempty-vowel)
    (handempty-consonant)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (ontable O)
  ))
)