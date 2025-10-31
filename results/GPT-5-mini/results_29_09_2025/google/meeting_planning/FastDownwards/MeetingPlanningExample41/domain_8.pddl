(define (domain meetup-day)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types location agent time)

  (:constants you george - agent northbeach haight - location)

  (:functions (total-cost))

  (:predicates
    (at ?a - agent ?l - location)
    (time-at ?t - time)
    (met-george)
    (done)
    (travel-nb-ha ?s - time ?e - time)
    (travel-ha-nb ?s - time ?e - time)
    (meeting-allowed ?s - time ?e - time)
  )

  (:action you-travel-nb-ha
    :parameters (?s - time ?e - time)
    :precondition (and (at you northbeach) (time-at ?s) (travel-nb-ha ?s ?e))
    :effect (and
      (not (at you northbeach))
      (at you haight)
      (not (time-at ?s))
      (time-at ?e)
      (increase (total-cost) 18)
    )
  )

  (:action you-travel-ha-nb
    :parameters (?s - time ?e - time)
    :precondition (and (at you haight) (time-at ?s) (travel-ha-nb ?s ?e))
    :effect (and
      (not (at you haight))
      (at you northbeach)
      (not (time-at ?s))
      (time-at ?e)
      (increase (total-cost) 19)
    )
  )

  (:action you-meet-george
    :parameters (?s - time ?e - time)
    :precondition (and
      (at you haight)
      (time-at ?s)
      (meeting-allowed ?s ?e)
      (not (met-george))
    )
    :effect (and
      (met-george)
      (not (time-at ?s))
      (time-at ?e)
      (increase (total-cost) -10000)
    )
  )

  (:action end-day
    :parameters (?s - time)
    :precondition (time-at ?s)
    :effect (and (done))
  )
)