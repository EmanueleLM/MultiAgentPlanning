(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)    ; person is in city at a particular day
    (next ?d - day ?dn - day)              ; day successor relation: ?dn is next day after ?d
  )

  ;; --- Stay actions (agent-specific responsibilities kept distinct) ---
  (:action berlin_planner-stay
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Berlin ?d) (next ?d ?dn))
    :effect (and (not (at ?p Berlin ?d)) (at ?p Berlin ?dn))
  )

  (:action frankfurt_planner-stay
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Frankfurt ?d) (next ?d ?dn))
    :effect (and (not (at ?p Frankfurt ?d)) (at ?p Frankfurt ?dn))
  )

  (:action bucharest_planner-stay
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Bucharest ?d) (next ?d ?dn))
    :effect (and (not (at ?p Bucharest ?d)) (at ?p Bucharest ?dn))
  )

  ;; --- Flight actions (only direct flights explicitly modeled) ---
  ;; Berlin <-> Frankfurt (direct)
  (:action berlin_planner-fly-Berlin-to-Frankfurt
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Berlin ?d) (next ?d ?dn))
    :effect (and (not (at ?p Berlin ?d)) (at ?p Frankfurt ?dn))
  )

  (:action frankfurt_planner-fly-Frankfurt-to-Berlin
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Frankfurt ?d) (next ?d ?dn))
    :effect (and (not (at ?p Frankfurt ?d)) (at ?p Berlin ?dn))
  )

  ;; Frankfurt <-> Bucharest (direct)
  (:action frankfurt_planner-fly-Frankfurt-to-Bucharest
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Frankfurt ?d) (next ?d ?dn))
    :effect (and (not (at ?p Frankfurt ?d)) (at ?p Bucharest ?dn))
  )

  (:action frankfurt_planner-fly-Bucharest-to-Frankfurt
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p Bucharest ?d) (next ?d ?dn))
    :effect (and (not (at ?p Bucharest ?d)) (at ?p Frankfurt ?dn))
  )

  ;; NOTE: No direct Berlin<->Bucharest flight action is provided, reflecting the constraint that
  ;; direct flights between Berlin and Bucharest do not exist and that travel between them must
  ;; be routed via Frankfurt (modelled by the available actions above).

)