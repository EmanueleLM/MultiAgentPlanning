(define (problem mystery_blocksworld1_instance)
  (:domain mystery_blocksworld1)
  (:objects
    a b c d - object
  )
  (:init
    (craves b c)
    (craves c d)
    (craves d a)
    (harmony)
    (planet a)
    (province b)
  )
  (:goal (and
    (craves a c)
    (craves d a)
  ))
)