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

  (:action execute_schedule_1730
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler_at ?p bayview t0900)
      (john_available t1730 t2100)
      (travel_leg bayview russian_hill t1707 t1730)
      (travel_leg russian_hill bayview t1845 t1908)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met_at_least_75)
      (not (traveler_at ?p bayview t0900))
      (traveler_at ?p bayview t1908)
    )
  )

  (:action execute_schedule_1800
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler_at ?p bayview t0900)
      (john_available t1730 t2100)
      (travel_leg bayview russian_hill t1737 t1800)
      (travel_leg russian_hill bayview t1915 t1938)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met_at_least_75)
      (not (traveler_at ?p bayview t0900))
      (traveler_at ?p bayview t1938)
    )
  )

  (:action execute_schedule_1945
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler_at ?p bayview t0900)
      (john_available t1730 t2100)
      (travel_leg bayview russian_hill t1922 t1945)
      (travel_leg russian_hill bayview t2100 t2123)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met_at_least_75)
      (not (traveler_at ?p bayview t0900))
      (traveler_at ?p bayview t2123)
    )
  )
)