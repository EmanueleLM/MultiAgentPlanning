(define (problem provinces-problem)
  (:domain provinces)
  (:objects a b c d - obj)
  (:init
    ;; initial facts
    (craves b a)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province c)
    (province d)
  )
  (:goal (and
           (craves b a)
           (craves d c)
         ))
)