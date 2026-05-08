(define (problem mysteryblocksworld27)
  (:domain mystery-blocksworld)
  (:objects a b c d)

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