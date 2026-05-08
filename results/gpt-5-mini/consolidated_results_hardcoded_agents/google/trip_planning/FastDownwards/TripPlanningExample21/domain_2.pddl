(define (domain multi_city_itinerary)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person city day slot)

  (:predicates
    (flight ?from - city ?to - city)
    (next ?d - day ?d2 - day)
    (at ?p - person ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (unassigned ?d - day)
    (slot-fulfilled ?s - slot)
    (workshop-done)
    (workshop-window ?d - day)
    (started)
    (occupied ?d - day)
    (start-day ?d - day)
    (workshop-city ?c - city)
  )

  (:action start-in
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and (not (started)) (start-day ?d) (unassigned ?d))
    :effect (and (started)
                 (at ?p ?c ?d)
                 (visited ?c ?d)
                 (occupied ?d))
  )

  (:action stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and (at ?p ?c ?d) (next ?d ?d2))
    :effect (and (at ?p ?c ?d2)
                 (visited ?c ?d2)
                 (occupied ?d2)
                 (not (at ?p ?c ?d)))
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?p ?from ?d) (flight ?from ?to) (next ?d ?d2))
    :effect (and (at ?p ?to ?d2)
                 (visited ?to ?d2)
                 (occupied ?d2)
                 (not (at ?p ?from ?d)))
  )

  (:action fulfill-slot
    :parameters (?s - slot ?c - city ?d - day)
    :precondition (and (not (slot-fulfilled ?s)) (visited ?c ?d) (unassigned ?d))
    :effect (and (slot-fulfilled ?s)
                 (not (unassigned ?d)))
  )

  (:action relax-slot
    :parameters (?s - slot)
    :precondition (not (slot-fulfilled ?s))
    :effect (slot-fulfilled ?s)
  )

  (:action fulfill-workshop
    :parameters (?c - city ?d - day)
    :precondition (and (not (workshop-done)) (visited ?c ?d) (workshop-window ?d) (workshop-city ?c))
    :effect (workshop-done)
  )
)