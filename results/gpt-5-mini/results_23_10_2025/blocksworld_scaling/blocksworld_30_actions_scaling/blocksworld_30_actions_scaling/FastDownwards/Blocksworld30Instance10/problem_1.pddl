(define (problem blocks-sequence-problem)
  (:domain blocks-sequence)
  (:objects)
  (:init
    ;; initial stacking
    (on A C)
    (on C K)
    (on H G)
    (on G B)
    (on D E)
    (on I J)
    (on J F)

    ;; table blocks
    (ontable K)
    (ontable B)
    (ontable E)
    (ontable F)

    ;; clear (top blocks initially)
    (clear A)
    (clear H)
    (clear D)
    (clear I)

    ;; nobody is holding anything initially
    (handempty)

    ;; step bookkeeping: start at done0
    (done0)
  )
  ;; Goal: complete the whole provided 30-step action sequence
  (:goal (and (done30)))
)