(define (domain trip14days)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city day level)
  (:predicates
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (last ?d - day)
    (in-window ?d - day)
    (direct ?c1 - city ?c2 - city)
    (met)
    (sealed)
    (visited ?c - city)
    (quota-closed ?c - city)
    (current-count ?c - city ?l - level)
    (max-level ?c - city ?l - level)
    (succ ?l1 - level ?l2 - level)
    (is-florence ?c - city)
    (is-barcelona ?c - city)
    (is-helsinki ?c - city)
  )
  (:functions (total-cost))

  (:action start-day1
    :parameters (?c - city ?d - day ?l1 - level ?l2 - level)
    :precondition (and
      (first ?d)
      (not (assigned ?d))
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (assigned ?d)
      (at ?c ?d)
      (visited ?c)
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
    )
  )

  (:action stay-next-within
    :parameters (?c - city ?dprev - day ?dnext - day ?l1 - level ?l2 - level)
    :precondition (and
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?c ?dprev)
      (not (assigned ?dnext))
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (assigned ?dnext)
      (at ?c ?dnext)
      (visited ?c)
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
    )
  )

  (:action fly-next-within
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day ?l1 - level ?l2 - level)
    :precondition (and
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?from ?dprev)
      (direct ?from ?to)
      (not (assigned ?dnext))
      (current-count ?to ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?to ?l1))
    )
    :effect (and
      (assigned ?dnext)
      (at ?to ?dnext)
      (visited ?to)
      (not (current-count ?to ?l1))
      (current-count ?to ?l2)
      (increase (total-cost) 1)
    )
  )

  (:action stay-next-over-florence
    :parameters (?c - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-florence ?c)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?c ?dprev)
      (not (assigned ?dnext))
      (current-count ?c ?l)
      (max-level ?c ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?c ?dnext)
      (visited ?c)
      (increase (total-cost) 5)
    )
  )

  (:action stay-next-over-barcelona
    :parameters (?c - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-barcelona ?c)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?c ?dprev)
      (not (assigned ?dnext))
      (current-count ?c ?l)
      (max-level ?c ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?c ?dnext)
      (visited ?c)
      (increase (total-cost) 1)
    )
  )

  (:action stay-next-over-helsinki
    :parameters (?c - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-helsinki ?c)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?c ?dprev)
      (not (assigned ?dnext))
      (current-count ?c ?l)
      (max-level ?c ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?c ?dnext)
      (visited ?c)
      (increase (total-cost) 4)
    )
  )

  (:action fly-next-over-florence
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-florence ?to)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?from ?dprev)
      (direct ?from ?to)
      (not (assigned ?dnext))
      (current-count ?to ?l)
      (max-level ?to ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?to ?dnext)
      (visited ?to)
      (increase (total-cost) 5)
      (increase (total-cost) 1)
    )
  )

  (:action fly-next-over-barcelona
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-barcelona ?to)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?from ?dprev)
      (direct ?from ?to)
      (not (assigned ?dnext))
      (current-count ?to ?l)
      (max-level ?to ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?to ?dnext)
      (visited ?to)
      (increase (total-cost) 1)
      (increase (total-cost) 1)
    )
  )

  (:action fly-next-over-helsinki
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day ?l - level)
    :precondition (and
      (is-helsinki ?to)
      (next ?dprev ?dnext)
      (assigned ?dprev)
      (at ?from ?dprev)
      (direct ?from ?to)
      (not (assigned ?dnext))
      (current-count ?to ?l)
      (max-level ?to ?l)
    )
    :effect (and
      (assigned ?dnext)
      (at ?to ?dnext)
      (visited ?to)
      (increase (total-cost) 4)
      (increase (total-cost) 1)
    )
  )

  (:action meet-in-florence
    :parameters (?c - city ?d - day)
    :precondition (and
      (is-florence ?c)
      (in-window ?d)
      (at ?c ?d)
      (not (met))
    )
    :effect (met)
  )

  (:action seal-schedule
    :parameters (?d - day)
    :precondition (and
      (last ?d)
      (assigned ?d)
      (not (sealed))
    )
    :effect (sealed)
  )

  (:action pay-shortfall-florence
    :parameters (?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (sealed)
      (is-florence ?c)
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
      (increase (total-cost) 5)
    )
  )

  (:action pay-shortfall-barcelona
    :parameters (?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (sealed)
      (is-barcelona ?c)
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
      (increase (total-cost) 1)
    )
  )

  (:action pay-shortfall-helsinki
    :parameters (?c - city ?l1 - level ?l2 - level)
    :precondition (and
      (sealed)
      (is-helsinki ?c)
      (current-count ?c ?l1)
      (succ ?l1 ?l2)
      (not (max-level ?c ?l1))
    )
    :effect (and
      (not (current-count ?c ?l1))
      (current-count ?c ?l2)
      (increase (total-cost) 4)
    )
  )

  (:action close-quota
    :parameters (?c - city ?l - level)
    :precondition (and
      (sealed)
      (current-count ?c ?l)
      (max-level ?c ?l)
      (not (quota-closed ?c))
    )
    :effect (quota-closed ?c)
  )
)