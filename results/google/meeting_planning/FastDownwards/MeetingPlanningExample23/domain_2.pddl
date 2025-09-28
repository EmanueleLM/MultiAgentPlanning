(define (domain bayview-scheduling-classical)
  (:requirements :typing :negative-preconditions :action-costs :adl)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location)
    (now ?t - time)
    (plus23 ?t - time ?t2 - time)
    (plus75 ?t - time ?t2 - time)
    (john-window-start ?t - time)
    (met-john)
  )

  (:functions
    (total-cost)
  )

  (:action travel-bayview-to-russianhill
    :parameters (?t - time ?t2 - time ?p - person)
    :precondition (and (now ?t) (plus23 ?t ?t2) (at ?p bayview))
    :effect (and
      (not (now ?t))
      (now ?t2)
      (not (at ?p bayview))
      (at ?p russianhill)
      (increase (total-cost) 23)
    )
  )

  (:action travel-russianhill-to-bayview
    :parameters (?t - time ?t2 - time ?p - person)
    :precondition (and (now ?t) (plus23 ?t ?t2) (at ?p russianhill))
    :effect (and
      (not (now ?t))
      (now ?t2)
      (not (at ?p russianhill))
      (at ?p bayview)
      (increase (total-cost) 23)
    )
  )

  (:action meet-with-john
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (plus75 ?t ?t2) (john-window-start ?t) (at visitor russianhill) (at john russianhill))
    :effect (and
      (not (now ?t))
      (now ?t2)
      (met-john)
      (increase (total-cost) 75)
    )
  )
)