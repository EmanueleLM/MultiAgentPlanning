(define (problem craving-problem)
  (:domain craving-domain)
  (:objects a b c d - obj)
  (:init
    ;; initial cravings
    (craves a d)
    (craves b c)
    ;; harmony and planets
    (harmony)
    (planet c)
    (planet d)
    ;; initial provinces
    (province a)
    (province b)
  )
  (:goal (and (craves b d) (craves d a)))
)