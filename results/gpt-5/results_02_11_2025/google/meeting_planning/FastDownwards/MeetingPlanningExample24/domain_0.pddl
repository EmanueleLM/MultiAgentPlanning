(define (domain sf_day_meetings)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location person time
  )
  (:predicates
    (at ?l - location)
    (current-time ?t - time)
    (met ?p - person)
    (start-ok-matthew ?t - time)
    (plus1 ?t1 ?t2 - time)
    (plus17 ?t1 ?t2 - time)
    (plus18 ?t1 ?t2 - time)
    (plus30 ?t1 ?t2 - time)
  )
  (:functions (total-cost))
  
  (:action wait-1
    :parameters (?t ?t2 - time ?l - location)
    :precondition (and
      (current-time ?t)
      (plus1 ?t ?t2)
      (at ?l)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (increase (total-cost) 1)
    )
  )

  (:action move-nobhill-to-presidio
    :parameters (?t ?t2 - time)
    :precondition (and
      (current-time ?t)
      (plus17 ?t ?t2)
      (at nob_hill)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (not (at nob_hill))
      (at presidio)
      (increase (total-cost) 17)
    )
  )

  (:action move-presidio-to-nobhill
    :parameters (?t ?t2 - time)
    :precondition (and
      (current-time ?t)
      (plus18 ?t ?t2)
      (at presidio)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (not (at presidio))
      (at nob_hill)
      (increase (total-cost) 18)
    )
  )

  (:action meet-matthew-30
    :parameters (?t ?t2 - time)
    :precondition (and
      (current-time ?t)
      (plus30 ?t ?t2)
      (start-ok-matthew ?t)
      (at presidio)
      (not (met matthew))
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (met matthew)
      (increase (total-cost) 30)
    )
  )
)