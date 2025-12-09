(define (problem crave_problem)
  (:domain crave_domain)
  (:objects a b c d - obj)

  (:init
    (province a)
    (province c)

    (planet a)
    (planet d)

    (craves b d)
    (craves c b)

    (harmony)
  )

  (:goal (and (craves a c) (craves b a)))
)