(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)    ; person is in city on a particular day
    (next ?d - day ?dn - day)              ; day successor relation: ?dn is next day after ?d
  )

  ;; Stay action: remain in same city from day d to next day dn
  (:action stay-in-city
    :parameters (?p - person ?c - city ?d - day ?dn - day)
    :precondition (and (at ?p ?c ?d) (next ?d ?dn))
    :effect (and (not (at ?p ?c ?d)) (at ?p ?c ?dn))
  )

  ;; Flight actions (only direct flights are allowed). Each flight advances one day.
  ;; Berlin <-> Frankfurt (direct)
  (:action fly-Berlin-to-Frankfurt
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Berlin ?d) (next ?d ?dn))
    :effect (and (not (at ?p Berlin ?d)) (at ?p Frankfurt ?dn))
  )
  (:action fly-Frankfurt-to-Berlin
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Frankfurt ?d) (next ?d ?dn))
    :effect (and (not (at ?p Frankfurt ?d)) (at ?p Berlin ?dn))
  )

  ;; Frankfurt <-> Bucharest (direct)
  (:action fly-Frankfurt-to-Bucharest
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Frankfurt ?d) (next ?d ?dn))
    :effect (and (not (at ?p Frankfurt ?d)) (at ?p Bucharest ?dn))
  )
  (:action fly-Bucharest-to-Frankfurt
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Bucharest ?d) (next ?d ?dn))
    :effect (and (not (at ?p Bucharest ?d)) (at ?p Frankfurt ?dn))
  )
)