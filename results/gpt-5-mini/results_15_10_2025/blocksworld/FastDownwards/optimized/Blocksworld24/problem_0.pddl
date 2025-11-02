(define (problem blocks_coordination)
  (:domain blocks_multiagent)
  (:objects A B C D E F G H I J K L M N - block)
  (:init
    ;; Initial stack relations for Stack1: bottom B K F M L I top
    (on K B)
    (on F K)
    (on M F)
    (on L M)
    (on I L)
    (ontable B)

    ;; Stack2: bottom G N D A top
    (on N G)
    (on D N)
    (on A D)
    (ontable G)

    ;; Stack3: bottom E C H top
    (on C E)
    (on H C)
    (ontable E)

    ;; Stack4: bottom J top
    (ontable J)

    ;; Tops are clear
    (clear I)
    (clear A)
    (clear H)
    (clear J)

    ;; Agents initially free (not holding anything)
    (free-vowel)
    (free-consonant)

    ;; Type/classification of blocks (private capability constraints encoded as predicates)
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
    ;; Final single stack (top-to-bottom A B C D E F G H I J K L M N with N on table)
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