(define (problem craving-problem)
  (:domain craving-domain)

  (:objects
    a b c d - object
    p1 p2 p3 p4 - phase
  )

  (:init
    ;; Initial craving relations
    (craves a d)
    (craves b c)
    (craves d b)

    ;; Initial global facts
    (harmony)
    (planet c)
    (province a)

    ;; Phase ordering and initial current phase
    (phase p1) (phase p2) (phase p3) (phase p4)
    (phase-successor p1 p2)
    (phase-successor p2 p3)
    (phase-successor p3 p4)
    (current-phase p1)
  )

  (:goal (and
    (craves a c)
  ))
)