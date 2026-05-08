(define (problem craving-problem)
  (:domain craving-domain)
  (:objects a b d - obj)
  (:init
    ;; Start in the initial phase. No "craves" facts hold initially.
    (phase0)
  )
  ;; Goal requires both craving relations be true and that the plan progressed to the terminal phase2.
  (:goal (and (craves b d) (craves d a) (phase2)))
)