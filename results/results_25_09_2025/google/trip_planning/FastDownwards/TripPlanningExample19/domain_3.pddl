(define (domain trip-orchestration)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs :equality)
  (:types agent city)

  (:predicates
    (traveler-agent ?a - agent)
    (flights-agent ?a - agent)
    (at ?a - agent ?c - city)
    (direct ?c1 - city ?c2 - city)
    (flight-available ?c1 - city ?c2 - city)
    (met-friends)
    (is-nice ?c - city)
  )

  (:functions
    (total-cost)
    (remaining)
    (day)
    (need ?c - city)
  )

  (:action flights_info-provide
    :parameters (?fa - agent ?from - city ?to - city)
    :precondition (and (flights-agent ?fa) (direct ?from ?to))
    :effect (and
      (flight-available ?from ?to)
      (flight-available ?to ?from)
      (increase (total-cost) 0)
    )
  )

  (:action traveler-fly
    :parameters (?ta - agent ?from - city ?to - city)
    :precondition (and (traveler-agent ?ta) (at ?ta ?from) (flight-available ?from ?to))
    :effect (and
      (not (at ?ta ?from))
      (at ?ta ?to)
      (increase (total-cost) 1)
    )
  )

  (:action traveler-stay
    :parameters (?ta - agent ?c - city)
    :precondition (and
      (traveler-agent ?ta)
      (at ?ta ?c)
      (> (need ?c) 0)
      (> (remaining) 0)
    )
    :effect (and
      (decrease (need ?c) 1)
      (decrease (remaining) 1)
      (increase (day) 1)
      (increase (total-cost) 1)
    )
  )

  (:action traveler-meet-friends
    :parameters (?ta - agent ?c - city)
    :precondition (and
      (traveler-agent ?ta)
      (at ?ta ?c)
      (is-nice ?c)
      (not (met-friends))
      (>= (day) 1)
      (<= (day) 6)
    )
    :effect (and
      (met-friends)
      (increase (total-cost) 0)
    )
  )
)