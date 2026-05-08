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

  ;; Three concrete schedule choices. Each is an atomic choice that:
  ;; - requires the traveler to start at bayview at t0900,
  ;; - requires John's availability window to exist,
  ;; - requires the specific outbound and return travel legs to be available,
  ;; - requires that no schedule has been chosen yet.
  ;; Effects mark a flag chosen, assert that the 75-minute meeting requirement is met,
  ;; remove the initial traveler-at fact and set the traveler's final location/time.
  (:action execute-schedule-1730
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      (travel-leg bayview russian_hill t1707 t1730)
      (travel-leg russian_hill bayview t1845 t1908)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met-at-least-75)
      (not (traveler-at ?p bayview t0900))
      (traveler-at ?p bayview t1908)
    )
  )

  (:action execute-schedule-1800
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      (travel-leg bayview russian_hill t1737 t1800)
      (travel-leg russian_hill bayview t1915 t1938)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met-at-least-75)
      (not (traveler-at ?p bayview t0900))
      (traveler-at ?p bayview t1938)
    )
  )

  (:action execute-schedule-1945
    :parameters (?p - agent ?f - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      (travel-leg bayview russian_hill t1922 t1945)
      (travel-leg russian_hill bayview t2100 t2123)
      (not (chosen ?f))
    )
    :effect (and
      (chosen ?f)
      (met-at-least-75)
      (not (traveler-at ?p bayview t0900))
      (traveler-at ?p bayview t2123)
    )
  )
)