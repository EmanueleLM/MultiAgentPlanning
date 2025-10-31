(define (problem BlocksworldScaling141-problem)
  (:domain BlocksworldScaling141)

  (:objects
    A E I - vowel
    J L M C D K B F H G - consonant
  )

  (:init
    ;; initial on relations
    (on M J)
    (on C M)
    (on K C)
    (on F K)
    (on I F)

    (on D L)
    (on H D)

    (on B E)
    (on A B)
    (on G A)

    ;; initial table bottoms
    (ontable J)
    (ontable L)
    (ontable E)

    ;; clear (top) blocks initially
    (clear I)
    (clear H)
    (clear G)
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
    (ontable M)
  ))
)