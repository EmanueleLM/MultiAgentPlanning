(define (domain meeting-planning-example16-strips)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location person traveler time
  )
  (:constants
    chinatown russianhill - location
    ronald - person
    me - traveler
  )
  (:predicates
    (at ?x - traveler ?l - location)
    (current-time ?t - time)
    (next ?from - time ?to - time)
    (plus7 ?from - time ?to - time)
    (plus9 ?from - time ?to - time)
    (plus105 ?from - time ?to - time)
    (can-start-ronald-105 ?t - time)
    (met-ronald)
  )
  (:functions
    (total-cost)
  )

  (:action wait-at-chinatown
    :parameters (?from - time ?to - time)
    :precondition (and
      (at me chinatown)
      (current-time ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (current-time ?from))
      (current-time ?to)
      (increase (total-cost) 1)
    )
  )

  (:action wait-at-russianhill
    :parameters (?from - time ?to - time)
    :precondition (and
      (at me russianhill)
      (current-time ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (current-time ?from))
      (current-time ?to)
      (increase (total-cost) 1)
    )
  )

  (:action travel-ct-to-rh
    :parameters (?from - time ?to - time)
    :precondition (and
      (at me chinatown)
      (current-time ?from)
      (plus7 ?from ?to)
    )
    :effect (and
      (not (at me chinatown))
      (at me russianhill)
      (not (current-time ?from))
      (current-time ?to)
      (increase (total-cost) 7)
    )
  )

  (:action travel-rh-to-ct
    :parameters (?from - time ?to - time)
    :precondition (and
      (at me russianhill)
      (current-time ?from)
      (plus9 ?from ?to)
    )
    :effect (and
      (not (at me russianhill))
      (at me chinatown)
      (not (current-time ?from))
      (current-time ?to)
      (increase (total-cost) 9)
    )
  )

  (:action meet-ronald-105
    :parameters (?from - time ?to - time)
    :precondition (and
      (at me russianhill)
      (current-time ?from)
      (plus105 ?from ?to)
      (can-start-ronald-105 ?from)
      (not (met-ronald))
    )
    :effect (and
      (met-ronald)
      (not (current-time ?from))
      (current-time ?to)
    )
  )
)