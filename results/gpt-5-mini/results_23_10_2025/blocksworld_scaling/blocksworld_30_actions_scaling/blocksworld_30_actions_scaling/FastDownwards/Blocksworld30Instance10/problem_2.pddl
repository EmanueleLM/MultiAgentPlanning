(define (problem blocks-sequence-problem)
  (:domain blocks-sequence)
  (:objects)
  (:init
    (on A C)
    (on C K)
    (on H G)
    (on G B)
    (on D E)
    (on I J)
    (on J F)

    (ontable K)
    (ontable B)
    (ontable E)
    (ontable F)

    (clear A)
    (clear H)
    (clear D)
    (clear I)

    (handempty)

    (done0)
  )
  (:goal (and (done30)))
)