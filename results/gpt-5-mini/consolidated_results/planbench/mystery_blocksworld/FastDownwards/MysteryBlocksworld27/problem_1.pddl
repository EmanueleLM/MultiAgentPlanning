(define (problem mystery-blocksworld-problem)
  (:domain mystery-blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a d)
    (craves c b)
    (harmony)
    (planet b)
    (planet d)
    (province a)
    (province c)
  )
  (:goal (and
    (craves b a)
    (craves c b)
    (craves d c)
  ))
)