(define (problem bw-multi-problem)
  (:domain blocksworld-multiagent)
  (:objects
    A E I - vowel
    B C D F G H J K - consonant
  )
  (:init
    ;; stack 1: H (table) -> B -> C -> K (top)
    (ontable H)
    (on B H)
    (on C B)
    (on K C)

    ;; stack 2: J (table) -> F -> A -> G -> D (top)
    (ontable J)
    (on F J)
    (on A F)
    (on G A)
    (on D G)

    ;; stack 3: E (table) -> I (top)
    (ontable E)
    (on I E)

    ;; clear tops
    (clear K)
    (clear D)
    (clear I)

    ;; hands empty
    (handempty-vowel)
    (handempty-consonant)
  )

  (:goal (and
    ;; final single tower (bottom -> top):
    ;; K on table; J on K; I on J; H on I; G on H; F on G; E on F; D on E; C on D; B on C; A on B
    (ontable K)
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