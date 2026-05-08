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
  )

  ;; Start in a chosen city on day1
  (:action start-in
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and (not (started)) (eq ?d day1))
    :effect (and (started)
                 (at ?p ?c ?d)
                 (visited ?c ?d)
                 (occupied ?d))
  )

  ;; Stay in same city to next day
  (:action stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and (at ?p ?c ?d) (next ?d ?d2))
    :effect (and (at ?p ?c ?d2)
                 (visited ?c ?d2)
                 (occupied ?d2)
                 (not (at ?p ?c ?d)))
  )

  ;; Fly along allowed direct flights to next day
  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?p ?from ?d) (flight ?from ?to) (next ?d ?d2))
    :effect (and (at ?p ?to ?d2)
                 (visited ?to ?d2)
                 (occupied ?d2)
                 (not (at ?p ?from ?d)))
  )

  ;; Use a visited city-day to fulfill one preference slot (consumes that day for slot-mapping)
  (:action fulfill-slot
    :parameters (?s - slot ?c - city ?d - day)
    :precondition (and (not (slot-fulfilled ?s)) (visited ?c ?d) (unassigned ?d))
    :effect (and (slot-fulfilled ?s)
                 (not (unassigned ?d)))
  )

  ;; Relax a preference slot when insufficient days are available.
  ;; This is optional but available at cost so planner can resolve over-subscription.
  (:action relax-slot
    :parameters (?s - slot)
    :precondition (not (slot-fulfilled ?s))
    :effect (slot-fulfilled ?s)
    :cost 10
  )

  ;; Fulfill the Venice workshop requirement by being in Venice on some allowed workshop day
  (:action fulfill-workshop
    :parameters (?d - day)
    :precondition (and (not (workshop-done)) (visited Venice ?d) (workshop-window ?d))
    :effect (workshop-done)
  )
)