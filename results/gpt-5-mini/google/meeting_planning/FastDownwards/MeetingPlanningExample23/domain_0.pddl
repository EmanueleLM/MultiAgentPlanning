(define (domain bayview-scheduling)
  ; Target: FastDownwards (non-temporal STRIPS with typing and negative preconditions)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time flag)

  (:predicates
    ; agent location/time occupancy
    (traveler-at ?a - agent ?l - location ?t - time)

    ; John's availability expressed as an explicit interval fact (start,end are time objects)
    (john-available ?start - time ?end - time)

    ; Allowed travel legs (from,to,departure-time,arrival-time)
    (travel-leg ?from - location ?to - location ?dep - time ?arr - time)

    ; Meeting outcome predicates (used to express the mandated minimum and actual meeting lengths)
    (met-75)
    (met-90)
    (met-105)
    (met-210)
    (met-at-least-75)

    ; single-flag to ensure exactly one schedule is chosen (use negative preconditions to block repeats)
    (chosen ?f - flag)
  )

  ; Each concrete schedule is an action executed by the traveler. Actions are atomic to enforce
  ; the ordered event sequences asserted in the candidate schedules (no internal reordering).
  ; Preconditions ensure the travel legs used exist (which encodes the 23-minute transit where relevant),
  ; John's availability fact covers the required meeting windows, and the chosen-flag prevents more than
  ; one schedule from being picked.

  (:action execute-schedule-A
    :parameters (?p - agent ?fl - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      ; John must be available for the full meeting interval used by Schedule A
      (john-available t1730 t2100)
      ; explicit travel legs as given in Schedule A
      (travel-leg bayview russianhill t1707 t1730)
      (travel-leg russianhill bayview t2100 t2123)
      ; ensure no schedule has been chosen yet
      (not (chosen ?fl))
    )
    :effect (and
      (chosen ?fl)
      (met-210)                ; meet John 17:30–21:00 (210 minutes)
      (met-at-least-75)
      ; final traveler location after schedule A
      (traveler-at ?p bayview t2123)
    )
  )

  (:action execute-schedule-B
    :parameters (?p - agent ?fl - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      ; travel to Russian Hill mid-afternoon, as in Schedule B
      (travel-leg bayview russianhill t1507 t1530)
      (travel-leg russianhill bayview t2100 t2123)
      (not (chosen ?fl))
    )
    :effect (and
      (chosen ?fl)
      (met-210)                ; meet John 17:30–21:00 (210 minutes)
      (met-at-least-75)
      (traveler-at ?p bayview t2123)
    )
  )

  (:action execute-schedule-C
    :parameters (?p - agent ?fl - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      ; depart 17:07, arrive 17:30; return depart 18:45 arrive 19:08
      (travel-leg bayview russianhill t1707 t1730)
      (travel-leg russianhill bayview t1845 t1908)
      (not (chosen ?fl))
    )
    :effect (and
      (chosen ?fl)
      (met-75)                 ; meet John 17:30–18:45 (75 minutes)
      (met-at-least-75)
      (traveler-at ?p bayview t1908)
    )
  )

  (:action execute-schedule-D1
    :parameters (?p - agent ?fl - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      ; depart 16:30 arrive 16:53; return depart 19:00 arrive 19:23
      (travel-leg bayview russianhill t1630 t1653)
      (travel-leg russianhill bayview t1900 t1923)
      (not (chosen ?fl))
    )
    :effect (and
      (chosen ?fl)
      (met-90)                 ; meet John 17:30–19:00 (90 minutes)
      (met-at-least-75)
      (traveler-at ?p bayview t1923)
    )
  )

  (:action execute-schedule-D2
    :parameters (?p - agent ?fl - flag)
    :precondition (and
      (traveler-at ?p bayview t0900)
      (john-available t1730 t2100)
      ; depart 16:30 arrive 16:53; return depart 19:15 arrive 19:38
      (travel-leg bayview russianhill t1630 t1653)
      (travel-leg russianhill bayview t1915 t1938)
      (not (chosen ?fl))
    )
    :effect (and
      (chosen ?fl)
      (met-105)                ; meet John 17:30–19:15 (105 minutes)
      (met-at-least-75)
      (traveler-at ?p bayview t1938)
    )
  )
)