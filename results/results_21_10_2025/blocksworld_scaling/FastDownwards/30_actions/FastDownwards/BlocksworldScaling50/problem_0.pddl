(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  ;; Objects (the ten blocks), typed as vowels or consonants, plus the table place.
  (:objects
    A E I - vowel
    B C D F G H J - consonant
    table - place
  )

  (:init
    ;; Initial stacks (bottom -> top) as public information:
    ;; stack1 = J, E, G, I, B, H
    (on J table)
    (on E J)
    (on G E)
    (on I G)
    (on B I)
    (on H B)

    ;; stack2 = F
    (on F table)

    ;; stack3 = C, D, A
    (on C table)
    (on D C)
    (on A D)

    ;; Only top-of-stack blocks are clear (movable) at the start:
    ;; Tops: H (stack1), F (stack2), A (stack3)
    (clear H)
    (clear F)
    (clear A)
  )

  ;; Goal: single stack top-to-bottom: A on B on C on D on E on F on G on H on I on J with J on table.
  (:goal
    (and
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J table)
      (clear A)
    )
  )
)