; Problem: Build a single stack with J on the table and A on top of B, B on C, C on D, D on E,
; E on F, F on G, G on H, H on I, I on J.
; Assumption: The agents' local initial observations were not provided. To produce a complete,
; solver-compatible problem we assume all blocks A..J start individually on the table and are clear.
; Vowel/consonant classification follows English letters (vowels: A, E, I). The domain enforces
; that vowel blocks may only be moved by vowel-agent actions and consonants only by consonant-agent actions.
(define (problem build-stack)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J - block
  )
  (:init
    ;; type classification
    (vowel A)
    (vowel E)
    (vowel I)
    (cons B)
    (cons C)
    (cons D)
    (cons F)
    (cons G)
    (cons H)
    (cons J)

    ;; initial placement: all blocks on the table and clear
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

    ;; both agents' hands empty at start
    (handempty-vowel)
    (handempty-cons)
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
    (ontable J)
  ))
)