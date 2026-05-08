(define (domain meeting_planning23)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time flag)

  (:predicates
    (traveler-at ?a - agent ?l - location ?t - time)
    (travel-leg ?from - location ?to - location ?dep - time ?arr - time)
    (john-available ?start - time ?end - time)
    (chosen ?f - flag)
    (met-at-least-75)
  )

  ; Schedule actions are atomic choices. Each requires the traveler to start at bayview at t0900,
  ; the required travel legs to exist, John's availability interval to exist, and that no schedule
  ; has been chosen yet. Effects mark a schedule chosen, assert that the meeting-minimum was met,
  ; update the traveler's terminal location/time and remove the initial traveler-at fact.
  (:action execute-schedule-a
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      (travel-leg bayview russianhill t1707 t1730)
      (travel-leg russianhill bayview t2100 t2123)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met-at-least-75)
      (not (traveler-at ?p bayview t0900))
      (traveler-at ?p bayview t2123)
    )
  )

  (:action execute-schedule-b
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      (travel-leg bayview russianhill t1507 t1530)
      (travel-leg russianhill bayview t2100 t2123)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met-at-least-75)
      (not (traveler-at ?p bayview t0900))
      (traveler-at ?p bayview t2123)
    )
  )

  (:action execute-schedule-c
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      (travel-leg bayview russianhill t1707 t1730)
      (travel-leg russianhill bayview t1845 t1908)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met-at-least-75)
      (not (traveler-at ?p bayview t0900))
      (traveler-at ?p bayview t1908)
    )
  )

  (:action execute-schedule-d1
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      (travel-leg bayview russianhill t1630 t1653)
      (travel-leg russianhill bayview t1900 t1923)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met-at-least-75)
      (not (traveler-at ?p bayview t0900))
      (traveler-at ?p bayview t1923)
    )
  )

  (:action execute-schedule-d2
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      (travel-leg bayview russianhill t1630 t1653)
      (travel-leg russianhill bayview t1915 t1938)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met-at-least-75)
      (not (traveler-at ?p bayview t0900))
      (traveler-at ?p bayview t1938)
    )
  )
)