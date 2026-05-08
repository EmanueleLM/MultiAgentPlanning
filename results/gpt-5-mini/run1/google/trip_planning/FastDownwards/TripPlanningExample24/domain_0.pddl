(define (domain itinerary-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)        ; successor relation between days
    (in-day ?d - day ?c - city)      ; traveler is assigned to city on that day
    (assigned ?d - day)              ; day has been assigned to a city (prevents double-assignment)
    (workshop-held)                  ; workshop has been scheduled (must occur on a Florence day 1-4)
  )

  ;; Action by the itinerary planner to create the initial assignment: Day 1 = Florence.
  ;; This is specific to day1 to enforce the locked itinerary start.
  (:action planner-assign-start-day1
    :parameters ()
    :precondition (and (not (assigned day1)))
    :effect (and (in-day day1 florence) (assigned day1))
  )

  ;; General planner action to carry the same-city assignment forward from one day to the next.
  ;; Applicable to any city; ensures contiguity via next predicate and prevents double-assignment via assigned.
  (:action planner-stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (in-day ?d1 ?c) (not (assigned ?d2)))
    :effect (and (in-day ?d2 ?c) (assigned ?d2))
  )

  ;; Flight operator action: direct Florence -> Amsterdam transfer.
  ;; Encodes that direct flights exist only on this origin/destination pair (no Florence->Riga direct flight action).
  (:action flight-travel-florence-amsterdam
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (next ?d1 ?d2) (in-day ?d1 florence) (not (assigned ?d2)))
    :effect (and (in-day ?d2 amsterdam) (assigned ?d2))
  )

  ;; Flight operator action: direct Amsterdam -> Riga transfer.
  (:action flight-travel-amsterdam-riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (next ?d1 ?d2) (in-day ?d1 amsterdam) (not (assigned ?d2)))
    :effect (and (in-day ?d2 riga) (assigned ?d2))
  )

  ;; Planner actions to schedule the required workshop. There is one explicit action for each allowed day
  ;; (days 1-4) so that the workshop is constrained to occur only within that window.
  (:action schedule-workshop-day1
    :parameters ()
    :precondition (and (in-day day1 florence) (not (workshop-held)))
    :effect (workshop-held)
  )
  (:action schedule-workshop-day2
    :parameters ()
    :precondition (and (in-day day2 florence) (not (workshop-held)))
    :effect (workshop-held)
  )
  (:action schedule-workshop-day3
    :parameters ()
    :precondition (and (in-day day3 florence) (not (workshop-held)))
    :effect (workshop-held)
  )
  (:action schedule-workshop-day4
    :parameters ()
    :precondition (and (in-day day4 florence) (not (workshop-held)))
    :effect (workshop-held)
  )
)