(define (problem blocks-world-final-arrangement)
  (:domain blocks-world-multiagent)
  (:objects A B C D E F G H - block)

  (:init
    ;; Initial arrangement (as provided)
    (ontable A)
    (on B A)

    (on C H)
    (on H G)
    (on G F)
    (ontable F)

    (on D E)
    (ontable E)

    ;; initial clear/hand status computed from the initial stack configuration
    (clear B)
    (clear C)
    (clear D)
    (handempty)
  )

  ;; Goal: the final arrangement after applying the provided action sequence
  (:goal (and
    ;; A remains on the table with B on A
    (ontable A)
    (on B A)

    ;; D on B and C on D
    (on D B)
    (on C D)

    ;; E and F on the table remain so
    (ontable E)
    (ontable F)

    ;; G on F and H on G remain
    (on G F)
    (on H G)
  ))
)