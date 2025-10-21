(define (problem paltry_problem)
  (:domain paltry_domain)
  (:objects
    p1 p2 - agent
    table sink - location
    cup clip note coin - object
  )

  (:init
    ;; agent locations
    (at p1 table)
    (at p2 table)

    ;; objects located on table and initially available
    (atobj cup table)
    (atobj clip table)
    (atobj note table)
    (atobj coin table)

    (available cup)
    (available clip)
    (available note)
    (available coin)
  )

  (:goal (and
    ;; require that a cup has been processed (sip)
    (processed cup)
    ;; require that a clip has been attached to the note (clip)
    (attached clip note)
    ;; require that agent p1 has read/remembered the note (memory)
    (remembered p1 note)
    ;; require that the coin is locked (tightfisted)
    (locked coin)
  ))
)