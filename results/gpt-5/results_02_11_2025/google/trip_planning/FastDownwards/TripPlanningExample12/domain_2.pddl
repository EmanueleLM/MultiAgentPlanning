(define (domain trip-planning)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types day city level)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (in-window ?d - day)
    (is-tll ?c - city)
    (tll-window-satisfied)
    (schedule-complete)
    (visited ?c - city)
    (quota-level ?c - city ?l - level)
    (next-level ?l1 - level ?l2 - level)
  )
  (:functions
    (total-cost)
  )

  (:action assign-first-quota
    :parameters (?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (not (assigned d1))
      (quota-level ?c ?l1)
      (next-level ?l1 ?l2)
    )
    :effect (and
      (assigned d1)
      (at d1 ?c)
      (visited ?c)
      (not (quota-level ?c ?l1))
      (quota-level ?c ?l2)
    )
  )

  (:action assign-first-beyond
    :parameters (?c - city)
    :precondition (and
      (not (assigned d1))
      (quota-level ?c L0)
    )
    :effect (and
      (assigned d1)
      (at d1 ?c)
      (visited ?c)
      (increase (total-cost) 1)
    )
  )

  (:action stay-next-quota
    :parameters (?d1 - day ?d2 - day ?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
      (quota-level ?c ?l1)
      (next-level ?l1 ?l2)
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 ?c)
      (visited ?c)
      (not (quota-level ?c ?l1))
      (quota-level ?c ?l2)
    )
  )

  (:action stay-next-beyond
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
      (quota-level ?c L0)
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 ?c)
      (visited ?c)
      (increase (total-cost) 1)
    )
  )

  (:action fly-next-quota
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?l1 - level ?l2 - level)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (not (assigned ?d2))
      (direct ?from ?to)
      (quota-level ?to ?l1)
      (next-level ?l1 ?l2)
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 ?to)
      (visited ?to)
      (not (quota-level ?to ?l1))
      (quota-level ?to ?l2)
    )
  )

  (:action fly-next-beyond
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (not (assigned ?d2))
      (direct ?from ?to)
      (quota-level ?to L0)
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 ?to)
      (visited ?to)
      (increase (total-cost) 1)
    )
  )

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

  (:action mark-complete
    :precondition (and
      (assigned d15)
      (not (schedule-complete))
    )
    :effect (schedule-complete)
  )

  (:action pay-shortfall
    :parameters (?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (schedule-complete)
      (quota-level ?c ?l1)
      (next-level ?l1 ?l2)
    )
    :effect (and
      (not (quota-level ?c ?l1))
      (quota-level ?c ?l2)
      (increase (total-cost) 1)
    )
  )
)