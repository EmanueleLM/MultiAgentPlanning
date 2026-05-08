(define (domain meeting_planning23)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time flag)

  (:predicates
    (traveler_at ?a - agent ?l - location ?t - time)
    (travel_leg ?from - location ?to - location ?dep - time ?arr - time)
    (john_available ?start - time ?end - time)
    (chosen ?f - flag)
    (met_at_least_75)
  )

  (:action execute_schedule
    :parameters (?p - agent ?f - flag ?from - location ?to - location
                 ?dep1 - time ?arr1 - time ?dep2 - time ?arr2 - time
                 ?start - time ?availstart - time ?availend - time)
    :precondition (and
      (traveler_at ?p ?from ?start)
      (john_available ?availstart ?availend)
      (travel_leg ?from ?to ?dep1 ?arr1)
      (travel_leg ?to ?from ?dep2 ?arr2)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met_at_least_75)
      (not (traveler_at ?p ?from ?start))
      (traveler_at ?p ?from ?arr2)
    )
  )
)