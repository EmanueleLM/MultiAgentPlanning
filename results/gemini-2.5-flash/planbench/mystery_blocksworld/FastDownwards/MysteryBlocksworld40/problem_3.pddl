(define (problem mystery-blocksworld40-problem)
  (:domain mystery-blocksworld40)
  (:objects
    a b c d - object
  )
  (:init
    (object_craves b a)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province b)
    (province c)
    (province d)
    ; Inferred initial states based on mutual exclusivity invariant for province/pain
    (not (province a))
    (not (pain a))
    (not (planet b))
    (not (pain b))
    (not (pain c))
    (not (pain d))
  )
  (:goal (and
    (object_craves a b)
    (object_craves b c)
    (object_craves d a)
  ))