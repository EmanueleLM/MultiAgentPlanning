(define (problem mystery_blocksworld17-problem)
  (:domain mystery_blocksworld17)
  (:objects a b c d)

  (:init
    ;; initial cravings
    (object_craves a d)
    (object_craves c a)
    ;; initial global fluents
    (harmony)
    ;; planets
    (planet b)
    (planet d)
    ;; provinces
    (province b)
    (province c)
  )

  ;; Goal as specified by the human: a->b, c->a, d->c
  (:goal (and
           (object_craves a b)
           (object_craves c a)
           (object_craves d c)
         ))
)