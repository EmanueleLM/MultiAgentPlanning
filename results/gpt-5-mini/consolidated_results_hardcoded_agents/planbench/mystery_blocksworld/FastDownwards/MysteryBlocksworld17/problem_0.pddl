(define (problem scenario1)
  (:domain struggle)
  (:objects a b c d)
  (:init
    ;; initial craving facts
    (craves a d)
    (craves c a)
    ;; initial harmony and absence of pain
    (harmony)
    ;; initial planets and provinces (per-object)
    (planet b)
    (planet d)
    (province b)
    (province c)
  )
  ;; Goal: demonstrate a reachable Overcome outcome:
  ;; produce province on 'a', create the craving (a -> b), and have harmony restored.
  (:goal (and (province a) (craves a b) (harmony)))
)