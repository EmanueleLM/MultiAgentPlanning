(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types vehicle package location city truck plane stage)

  (:predicates
    (at ?v - vehicle ?l - location)          ; vehicle (truck or plane) at location
    (at-pkg ?p - package ?l - location)      ; package at location
    (in ?p - package ?v - vehicle)           ; package in vehicle
    (is-airport ?l - location)               ; location is an airport
    (in-city ?l - location ?c - city)        ; location belongs to a city
    (cur-stage ?s - stage)                   ; current global stage
    (next ?s1 - stage ?s2 - stage)           ; stage successor relation
  )

  ;; All actions must advance the global stage according to the explicit successor chain.
  ;; This enforces an explicit discrete-time progression (serial time-step advancement).
  ;; Each action takes the current stage ?s1 and the next stage ?s2 where (next ?s1 ?s2) holds,
  ;; requires (cur-stage ?s1) and in its effects deletes (cur-stage ?s1) and adds (cur-stage ?s2).

  ;; Truck actions: intra-city movement and load/unload at truck location
  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s1 - stage ?s2 - stage)
    :precondition (and
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  (:action truck_load
    :parameters (?t - truck ?p - package ?l - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at ?t ?l)
      (at-pkg ?p ?l)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in ?p ?t)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  (:action truck_unload
    :parameters (?t - truck ?p - package ?l - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at ?t ?l)
      (in ?p ?t)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (in ?p ?t))
      (at-pkg ?p ?l)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  ;; Airplane actions: inter-city movement between airports and load/unload at airport
  (:action plane_fly
    :parameters (?pl - plane ?from - location ?to - location ?cf - city ?ct - city ?s1 - stage ?s2 - stage)
    :precondition (and
      (at ?pl ?from)
      (is-airport ?from)
      (is-airport ?to)
      (in-city ?from ?cf)
      (in-city ?to ?ct)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  (:action plane_load
    :parameters (?pl - plane ?p - package ?l - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at ?pl ?l)
      (is-airport ?l)
      (at-pkg ?p ?l)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in ?p ?pl)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  (:action plane_unload
    :parameters (?pl - plane ?p - package ?l - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at ?pl ?l)
      (is-airport ?l)
      (in ?p ?pl)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (in ?p ?pl))
      (at-pkg ?p ?l)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )
)