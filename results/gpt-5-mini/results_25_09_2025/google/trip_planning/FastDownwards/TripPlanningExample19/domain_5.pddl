(define (domain trip-orchestration)
  (:requirements :strips :typing :negative-preconditions :adl :equality :action-costs)
  (:types agent city number)

  (:predicates
    (traveler-agent ?a - agent)
    (flights-agent ?a - agent)
    (at ?a - agent ?c - city)
    (direct ?c1 - city ?c2 - city)
    (flight-available ?c1 - city ?c2 - city)
    (met-friends)
    (is-nice ?c - city)
    (need ?c - city ?n - number)
    (remaining ?n - number)
    (day ?n - number)
    (dec ?x - number ?y - number)
    (inc ?x - number ?y - number)
    (meet-window ?n - number)
  )

  (:action flights_info-provide
    :parameters (?fa - agent ?from - city ?to - city)
    :precondition (and (flights-agent ?fa) (direct ?from ?to))
    :effect (and (flight-available ?from ?to) (flight-available ?to ?from))
    :cost 0
  )

  (:action traveler-fly
    :parameters (?ta - agent ?from - city ?to - city)
    :precondition (and (traveler-agent ?ta) (at ?ta ?from) (flight-available ?from ?to))
    :effect (and (not (at ?ta ?from)) (at ?ta ?to))
    :cost 1
  )

  (:action traveler-stay
    :parameters (?ta - agent ?c - city ?n - number ?nminus - number ?r - number ?rminus - number ?d - number ?dplus - number)
    :precondition (and (traveler-agent ?ta) (at ?ta ?c) (need ?c ?n) (dec ?n ?nminus) (remaining ?r) (dec ?r ?rminus) (day ?d) (inc ?d ?dplus))
    :effect (and (not (need ?c ?n)) (need ?c ?nminus) (not (remaining ?r)) (remaining ?rminus) (not (day ?d)) (day ?dplus))
    :cost 1
  )

  (:action traveler-meet-friends
    :parameters (?ta - agent ?c - city ?dn - number)
    :precondition (and (traveler-agent ?ta) (at ?ta ?c) (is-nice ?c) (not (met-friends)) (day ?dn) (meet-window ?dn))
    :effect (and (met-friends))
    :cost 0
  )
)