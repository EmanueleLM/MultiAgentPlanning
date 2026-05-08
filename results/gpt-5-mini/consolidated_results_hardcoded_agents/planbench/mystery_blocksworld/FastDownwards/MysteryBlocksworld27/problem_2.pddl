(define (problem mystery-blocksworld-problem)
  (:domain mystery-blocksworld)
  (:objects
    a c - obj
    b d - planet
  )
  (:init
    (craves a d)
    (craves c b)
    (harmony)
    (province a)
    (province c)
  )
  (:goal (and
    (craves b a)
    (craves c b)
    (craves d c)
  ))
)