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

  ;; Three concrete, atomic schedule actions (each represents a feasible outbound+meeting+return option
  ;; that satisfies John's availability and the minimum 75 minute meeting requirement).
  (:action execute_schedule_1730
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler_at ?p bayview t0900)
      (john_available t1730 t2100)
      (travel_leg bayview russian_hill t1707 t1730)   ;; depart 17:07 arrive 17:30
      (travel_leg russian_hill bayview t1845 t1908)   ;; depart 18:45 arrive 19:08
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
      (travel_leg bayview russian_hill t1737 t1800)   ;; depart 17:37 arrive 18:00
      (travel_leg russian_hill bayview t1915 t1938)   ;; depart 19:15 arrive 19:38
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
      (travel_leg bayview russian_hill t1922 t1945)   ;; depart 19:22 arrive 19:45
      (travel_leg russian_hill bayview t2100 t2123)   ;; depart 21:00 arrive 21:23
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