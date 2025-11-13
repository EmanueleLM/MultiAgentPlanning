(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :equality :numeric-fluents :action-costs)
  (:types
    day city
  )
  (:predicates
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (in-window ?d - day)
    (is-tll ?c - city)
    (tll-window-satisfied)
    (schedule-complete)
  )
  (:functions
    (total-cost)
    (days-in ?c - city)
    (shortage-left ?c - city)
  )

  ; Assign the first day (d1) within remaining quota for the chosen city (no cost)
  (:action assign-first-quota
    :parameters (?c - city)
    :precondition (and
      (not (assigned d1))
      (> (shortage-left ?c) 0)
    )
    :effect (and
      (assigned d1)
      (at d1 ?c)
      (increase (days-in ?c) 1)
      (decrease (shortage-left ?c) 1)
    )
  )

  ; Assign the first day (d1) beyond the city's quota (incurs unit cost)
  (:action assign-first-beyond-quota
    :parameters (?c - city)
    :precondition (and
      (not (assigned d1))
      (= (shortage-left ?c) 0)
    )
    :effect (and
      (assigned d1)
      (at d1 ?c)
      (increase (days-in ?c) 1)
      (increase (total-cost) 1)
    )
  )

  ; Stay in the same city on the next day while quota remains (no cost)
  (:action stay-next-quota
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
      (> (shortage-left ?c) 0)
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 ?c)
      (increase (days-in ?c) 1)
      (decrease (shortage-left ?c) 1)
    )
  )

  ; Stay in the same city on the next day beyond quota (incurs unit cost)
  (:action stay-next-beyond-quota
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
      (= (shortage-left ?c) 0)
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 ?c)
      (increase (days-in ?c) 1)
      (increase (total-cost) 1)
    )
  )

  ; Fly to a different city on the next day if a direct edge exists and quota remains (no cost)
  (:action fly-next-quota
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (not (assigned ?d2))
      (direct ?from ?to)
      (> (shortage-left ?to) 0)
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 ?to)
      (increase (days-in ?to) 1)
      (decrease (shortage-left ?to) 1)
    )
  )

  ; Fly to a different city on the next day if a direct edge exists beyond quota (incurs unit cost)
  (:action fly-next-beyond-quota
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (not (assigned ?d2))
      (direct ?from ?to)
      (= (shortage-left ?to) 0)
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 ?to)
      (increase (days-in ?to) 1)
      (increase (total-cost) 1)
    )
  )

  ; Mark the Tallinn-in-window requirement satisfied once any window day is assigned to TLL
  (:action satisfy-window
    :parameters (?d - day ?c - city)
    :precondition (and
      (in-window ?d)
      (at ?d ?c)
      (is-tll ?c)
      (not (tll-window-satisfied))
    )
    :effect (tll-window-satisfied)
  )

  ; Mark the schedule as complete once day d15 is assigned
  (:action mark-complete
    :precondition (and
      (assigned d15)
      (not (schedule-complete))
    )
    :effect (schedule-complete)
  )

  ; Pay shortfall penalties after the schedule is complete
  (:action pay-shortfall
    :parameters (?c - city)
    :precondition (and
      (schedule-complete)
      (> (shortage-left ?c) 0)
    )
    :effect (and
      (decrease (shortage-left ?c) 1)
      (increase (total-cost) 1)
    )
  )
)