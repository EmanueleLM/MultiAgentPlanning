(define (domain trip-planning-fd-classical)
  (:requirements :strips :typing :negative-preconditions)
  (:types city token)
  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (visited ?c - city)
    (unspent ?t - token)
    (spent ?t - token)
    (alloc ?t - token ?c - city)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay-one-day
    :parameters (?c - city ?t - token)
    :precondition (and
      (at ?c)
      (unspent ?t)
      (alloc ?t ?c)
    )
    :effect (and
      (spent ?t)
      (not (unspent ?t))
      (visited ?c)
    )
  )
)