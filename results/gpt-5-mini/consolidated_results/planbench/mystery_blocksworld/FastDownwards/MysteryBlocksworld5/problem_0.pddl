(define (problem craving-problem)
  (:domain craving-domain)

  (:objects
    a b c - object
    ag1 ag3 - agent
    place1 place2 - place
    p1 p2 p3 done - phase
  )

  (:init
    ;; Initial object locations
    (at a place1)
    (at c place2)

    ;; Agent initial locations
    (at-agent ag1 place2)
    (at-agent ag3 place1)

    ;; Explicit "other object" relations (represented explicitly and symmetrically where applicable)
    (other a b)
    (other b a)
    (other b c)
    (other c b)

    ;; Phase ordering and initial phase
    (phase p1)
    (phase-successor p1 p2)
    (phase-successor p2 p3)
    (phase-successor p3 done)

    ;; No cravings initially (omitted since craves is false by default)
  )

  ;; Goal: object a craves object c, final phase reached, both objects co-located at place1, and c not held
  (:goal (and
    (craves a c)
    (phase done)
    (at a place1)
    (at c place1)
    (not (held c))
  ))