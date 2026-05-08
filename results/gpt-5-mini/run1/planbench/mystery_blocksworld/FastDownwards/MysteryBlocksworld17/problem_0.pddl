(define (problem orchestrated-conflict-problem)
  (:domain orchestrated-conflict)
  (:objects a b c d)

  (:init
    ;; initial predicates as provided
    (object-craves a d)
    (object-craves c a)
    (harmony)
    (planet b)
    (planet d)
    (province b)
    (province c)
    ;; pain is absent initially (no (pain) fact)
    ;; no sequencing flags are set initially
  )

  ;; Goal: obtain an explicit, nontrivial terminal condition derived from the model:
  ;; require province a to exist and harmony to hold. (This enforces a sequence of actions
  ;; that creates province a while ensuring harmony is restored.)
  (:goal (and (province a) (harmony)))
)