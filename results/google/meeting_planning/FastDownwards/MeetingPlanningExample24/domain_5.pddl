(define (domain meeting-multiagent-classical)
  (:requirements :typing :negative-preconditions :existential-preconditions :action-costs)
  (:types person traveler - person location time)

  (:predicates
    (at ?p - person ?l - location)
    (free ?p - person)
    (now ?t - time)

    ;; temporal relations precomputed in problem
    (next ?t - time ?t2 - time)
    (plus17 ?t - time ?t2 - time)
    (plus18 ?t - time ?t2 - time)
    (plus30 ?t - time ?t2 - time)
    (allow-meeting-start ?t - time)

    (met ?a - person ?b - person)
  )

  (:action wait-1
    :parameters (?p - person ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (free ?p)
      (exists (?l - location) (at ?p ?l))
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
    )
    :cost 1
  )

  (:action travel-nobhill-presidio
    :parameters (?p - traveler ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (plus17 ?t ?t2)
      (free ?p)
      (at ?p nobhill)
    )
    :effect (and
      (not (at ?p nobhill))
      (at ?p presidio)
      (not (now ?t))
      (now ?t2)
    )
    :cost 17
  )

  (:action travel-presidio-nobhill
    :parameters (?p - traveler ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (plus18 ?t ?t2)
      (free ?p)
      (at ?p presidio)
    )
    :effect (and
      (not (at ?p presidio))
      (at ?p nobhill)
      (not (now ?t))
      (now ?t2)
    )
    :cost 18
  )

  (:action meet-you-matthew
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (plus30 ?t ?t2)
      (allow-meeting-start ?t)
      (at you presidio)
      (at matthew presidio)
      (free you)
      (free matthew)
    )
    :effect (and
      (met you matthew)
      (met matthew you)
      (not (now ?t))
      (now ?t2)
    )
    :cost 30
  )
)