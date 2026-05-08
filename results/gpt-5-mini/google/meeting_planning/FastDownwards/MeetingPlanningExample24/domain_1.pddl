(define (domain meet-matthew-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person location timepoint)

  (:constants
    you matthew - person
    nobhill presidio - location
    t0 t103 t120 t135 t150 t153 t163 t168 t180 t240 t258 t283 t300 t315 t328 t333 t345 t375 t393 - timepoint
  )

  (:predicates
    (at ?p - person ?l - location ?t - timepoint)
    (matt_available ?start - timepoint ?end - timepoint)
    (met_matt)
    (plan-chosen)
    (inperson_meeting ?p1 - person ?p2 - person ?loc - location ?start - timepoint ?end - timepoint)
  )

  (:functions
    (total-cost)
  )

  (:action plan-A
    :parameters ()
    :precondition (and
      (at you nobhill t0)
      (matt_available t345 t375)
      (not (plan-chosen))
    )
    :effect (and
      (met_matt)
      (plan-chosen)
      (inperson_meeting you matthew presidio t345 t375)
      (not (at you nobhill t0))
      (at you nobhill t393)
      (increase (total-cost) 65)
    )
  )

  (:action plan-B
    :parameters ()
    :precondition (and
      (at you nobhill t0)
      (matt_available t120 t150)
      (not (plan-chosen))
    )
    :effect (and
      (met_matt)
      (plan-chosen)
      (inperson_meeting you matthew presidio t120 t150)
      (not (at you nobhill t0))
      (at you nobhill t168)
      (increase (total-cost) 65)
    )
  )

  (:action plan-C
    :parameters ()
    :precondition (and
      (at you nobhill t0)
      (matt_available t180 t240)
      (not (plan-chosen))
    )
    :effect (and
      (met_matt)
      (plan-chosen)
      (inperson_meeting you matthew presidio t180 t240)
      (not (at you nobhill t0))
      (at you nobhill t258)
      (increase (total-cost) 95)
    )
  )

  (:action plan-E
    :parameters ()
    :precondition (and
      (at you nobhill t0)
      (matt_available t120 t375)
      (not (plan-chosen))
    )
    :effect (and
      (met_matt)
      (plan-chosen)
      (inperson_meeting you matthew presidio t120 t375)
      (not (at you nobhill t0))
      (at you nobhill t393)
      (increase (total-cost) 290)
    )
  )
)