(define (problem harmony-problem)
  (:domain harmony-domain)
  (:objects a b c d - obj)

  (:init
    (craves b a)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province c)
    (province d)
    ;; pain and attacked facts are false by default (closed world)
  )

  (:goal (and
    (craves b a)
    (craves d c)
  ))
)