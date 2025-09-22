(define (domain multi-agent-trip)
  (:requirements :typing :negative-preconditions :adl)
  (:types city day)

  (:predicates
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (flight ?from - city ?to - city)
    (workshop ?c - city)
    (allowed-workshop-day ?d - day)
    (attended-workshop)
    (stayed ?c - city ?d - day)
    (visited ?c - city)
  )

  ;; Flight actions (belonging to the flight_agent)
  (:action fly-flightagent
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?from) (flight ?from ?to) (current-day ?d) (next ?d ?dn))
    :effect (and
      (not (at ?from)) (at ?to) (visited ?to)
      (not (current-day ?d)) (current-day ?dn)
    )
  )

  ;; Stay actions (belonging to the stay_agent)
  (:action stay-stayagent
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c) (current-day ?d) (next ?d ?dn))
    :effect (and
      (stayed ?c ?d) (visited ?c)
      (not (current-day ?d)) (current-day ?dn)
    )
  )

  ;; Attend workshop actions (belonging to the stay_agent), only allowed on days marked for the workshop (day 5..8)
  (:action attend-stayagent
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c) (workshop ?c) (allowed-workshop-day ?d) (current-day ?d) (next ?d ?dn))
    :effect (and
      (attended-workshop) (stayed ?c ?d) (visited ?c)
      (not (current-day ?d)) (current-day ?dn)
    )
  )
)