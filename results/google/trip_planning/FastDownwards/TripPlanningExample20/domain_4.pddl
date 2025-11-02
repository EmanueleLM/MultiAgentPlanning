(define (domain trip-planning-example20)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city time level)
  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (visited ?c - city)
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
    (final ?t - time)
    (remain ?c - city ?l - level)
    (dec ?l1 - level ?l2 - level)
    (zero ?l - level)
    (pending-cost ?c - city)
  )
  (:functions (total-cost))

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  (:action stay-decrement
    :parameters (?c - city ?t1 - time ?t2 - time ?l1 - level ?l2 - level)
    :precondition (and
      (at ?c)
      (current ?t1)
      (next ?t1 ?t2)
      (remain ?c ?l1)
      (dec ?l1 ?l2)
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (visited ?c)
      (not (remain ?c ?l1))
      (remain ?c ?l2)
    )
  )

  (:action stay-over
    :parameters (?c - city ?t1 - time ?t2 - time ?l - level)
    :precondition (and
      (at ?c)
      (current ?t1)
      (next ?t1 ?t2)
      (remain ?c ?l)
      (zero ?l)
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (visited ?c)
      (increase (total-cost) 1)
    )
  )

  (:action pay-shortfall
    :parameters (?c - city ?l1 - level ?l2 - level ?t - time)
    :precondition (and
      (current ?t)
      (final ?t)
      (pending-cost ?c)
      (remain ?c ?l1)
      (dec ?l1 ?l2)
    )
    :effect (and
      (not (remain ?c ?l1))
      (remain ?c ?l2)
      (increase (total-cost) 1)
    )
  )

  (:action finalize-city
    :parameters (?c - city ?l - level ?t - time)
    :precondition (and
      (current ?t)
      (final ?t)
      (pending-cost ?c)
      (remain ?c ?l)
      (zero ?l)
    )
    :effect (and
      (not (pending-cost ?c))
    )
  )
)