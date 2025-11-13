(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types day city level)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (last ?d - day)
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
    (is-bottom ?l - level)
  )
  (:functions
    (total-cost)
  )

  (:action assign-first-quota
    :parameters (?d - day ?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (first ?d)
      (not (assigned ?d))
      (quota-level ?c ?l1)
      (next-level ?l1 ?l2)
    )
    :effect (and
      (assigned ?d)
      (at ?d ?c)
      (visited ?c)
      (not (quota-level ?c ?l1))
      (quota-level ?c ?l2)
    )
  )

  (:action assign-first-beyond
    :parameters (?d - day ?c - city ?l - level)
    :precondition (and
      (first ?d)
      (not (assigned ?d))
      (quota-level ?c ?l)
      (is-bottom ?l)
    )
    :effect (and
      (assigned ?d)
      (at ?d ?c)
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
    :parameters (?d1 - day ?d2 - day ?c - city ?l - level)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
      (quota-level ?c ?l)
      (is-bottom ?l)
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
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?l - level)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (not (assigned ?d2))
      (direct ?from ?to)
      (quota-level ?to ?l)
      (is-bottom ?l)
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
    :parameters (?d - day)
    :precondition (and
      (last ?d)
      (assigned ?d)
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