(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; at ?c ?d: you were in city ?c on day ?d (persistent record for that day)
    (at ?c - city ?d - day)

    ;; current-day ?d: the planner needs to assign which city the traveler is in for this day
    (current-day ?d - day)

    ;; next relation between day objects
    (next ?d - day ?dn - day)

    ;; connectivity (direct flights allowed). Include self-links so "staying" is treated as allowed connectivity.
    (connected ?c1 - city ?c2 - city)

    ;; workshop done marker
    (workshop-done)
  )

  ;; Assign the city for day1..day10.
  ;; This action assigns which city the traveler is in on the current day ?d, based on the city chosen the previous day (?prevd, ?prevc)
  ;; It requires that the previous day has already been assigned (at ?prevc ?prevd) and that a direct connection (or same-city) exists between ?prevc and ?c.
  ;; Effects: record at (?c ?d) and advance the current-day marker to the successor day.
  (:action assign-day
    :parameters (?prevd - day ?d - day ?prevc - city ?c - city ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?prevd ?d)
      (at ?prevc ?prevd)
      (connected ?prevc ?c)
      (next ?d ?dnext)
    )
    :effect (and
      (at ?c ?d)
      (not (current-day ?d))
      (current-day ?dnext)
    )
  )

  ;; Workshop actions: any one of these can make workshop-done true if the traveler was in Venice on that day.
  (:action hold-workshop-day5
    :parameters ()
    :precondition (at venice day5)
    :effect (workshop-done)
  )
  (:action hold-workshop-day6
    :parameters ()
    :precondition (at venice day6)
    :effect (workshop-done)
  )
  (:action hold-workshop-day7
    :parameters ()
    :precondition (at venice day7)
    :effect (workshop-done)
  )
  (:action hold-workshop-day8
    :parameters ()
    :precondition (at venice day8)
    :effect (workshop-done)
  )
  (:action hold-workshop-day9
    :parameters ()
    :precondition (at venice day9)
    :effect (workshop-done)
  )
  (:action hold-workshop-day10
    :parameters ()
    :precondition (at venice day10)
    :effect (workshop-done)
  )
)