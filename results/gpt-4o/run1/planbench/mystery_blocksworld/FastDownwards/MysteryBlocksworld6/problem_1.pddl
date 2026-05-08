(define (problem mystery_blocksworld6_instance)
  (:domain mystery_blocksworld6)
  (:objects a b c d - object)

  (:init
    (object_craves b c)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province d)
  )

  (:goal (and
    (object_craves a b)
    (object_craves b d)
    (object_craves d c)
  ))
)