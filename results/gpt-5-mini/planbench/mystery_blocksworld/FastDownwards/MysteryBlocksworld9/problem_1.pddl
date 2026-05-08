(define (problem mystery_blocksworld9-problem)
  (:domain mystery_blocksworld9)
  (:objects
    a b c d - obj
  )
  (:init
    ;; initial cravings
    (craves a d)
    (craves b c)

    ;; global condition
    (harmony)

    ;; planets
    (planet c)
    (planet d)

    ;; provinces
    (province a)
    (province b)
  )
  (:goal (and
           (craves b d)
           (craves d a)
         )
  )
)