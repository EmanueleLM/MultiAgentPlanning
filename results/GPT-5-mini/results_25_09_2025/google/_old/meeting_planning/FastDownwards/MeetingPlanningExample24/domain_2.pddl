(define (domain meeting-multiagent-classical)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person traveler - person location time)

  (:predicates
    (at ?p - person ?l - location)
    (free ?p - person)
    (now ?t - time)

    ;; arithmetic / temporal relations precomputed in problem
    (next ?t - time ?t2 - time)      ;; +1 minute
    (plus17 ?t - time ?t2 - time)    ;; t2 = t + 17
    (plus18 ?t - time ?t2 - time)    ;; t2 = t + 18
    (plus30 ?t - time ?t2 - time)    ;; t2 = t + 30
    (allow-meeting-start ?t - time)  ;; t is allowed meeting start (>=120 and <=345)

    (met ?a - person ?b - person)
  )

  (:functions
    (total-cost)
  )

  ;; wait one minute (consumes 1 minute)
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
      (increase (total-cost) 1)
    )
  )

  ;; travel Nob Hill -> Presidio takes 17 minutes (only travelers can travel)
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
      (increase (total-cost) 17)
    )
  )

  ;; travel Presidio -> Nob Hill takes 18 minutes (only travelers can travel)
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
      (increase (total-cost) 18)
    )
  )

  ;; joint meeting action: you meets matthew for 30 minutes at Presidio
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
      (increase (total-cost) 30)
    )
  )
)