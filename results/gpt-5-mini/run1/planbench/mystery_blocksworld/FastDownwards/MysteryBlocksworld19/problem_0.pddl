(define (problem orchestrated-problem)
  (:domain orchestrated-domain)
  (:objects
    a b c d - object
  )
  (:init
    ;; initial state (mapped to canonical predicates)
    (craves a c)
    (craves d a)
    (harmony)
    (planet b)
    (planet c)
    (province b)
    (province d)
    ;; Note: attacked/succumbed/overcome_done/feasted are implicitly false at start
  )
  ;; Goal: remove all cravings and restore global harmony (explicit hard constraints)
  ;; - Each preference is encoded as a strict goal condition.
  (:goal (and
    (not (craves a c))
    (not (craves d a))
    (harmony)
  ))
)