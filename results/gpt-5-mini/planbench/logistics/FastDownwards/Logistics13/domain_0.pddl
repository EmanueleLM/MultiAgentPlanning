(define (domain orchestrator_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types vehicle truck airplane package location)

  (:predicates
    (at ?v - vehicle ?loc - location)            ; vehicle at location
    (p-at ?p - package ?loc - location)         ; package at location (not in vehicle)
    (in ?p - package ?v - vehicle)              ; package loaded in vehicle
    (allowed-truck ?p - package)                ; package may be carried by truck
    (allowed-plane ?p - package)                ; package may be carried by plane
    (plane-free ?pl - airplane)                 ; airplane has capacity for one package (free)
    (road ?from - location ?to - location)      ; truck connectivity (directed)
    (air-route ?from - location ?to - location) ; airplane connectivity (directed)
  )

  ;; Truck actions
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and (at ?tr ?from) (road ?from ?to))
    :effect (and (not (at ?tr ?from)) (at ?tr ?to))
  )

  (:action load-onto-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and (p-at ?p ?loc) (at ?tr ?loc) (allowed-truck ?p))
    :effect (and (not (p-at ?p ?loc)) (in ?p ?tr))
  )

  (:action unload-from-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and (in ?p ?tr) (at ?tr ?loc))
    :effect (and (p-at ?p ?loc) (not (in ?p ?tr)))
  )

  ;; Airplane actions
  (:action fly-plane
    :parameters (?pl - airplane ?from - location ?to - location)
    :precondition (and (at ?pl ?from) (air-route ?from ?to))
    :effect (and (not (at ?pl ?from)) (at ?pl ?to))
  )

  (:action load-onto-plane
    :parameters (?p - package ?pl - airplane ?loc - location)
    :precondition (and (p-at ?p ?loc) (at ?pl ?loc) (allowed-plane ?p) (plane-free ?pl))
    :effect (and (not (p-at ?p ?loc)) (in ?p ?pl) (not (plane-free ?pl)))
  )

  (:action unload-from-plane
    :parameters (?p - package ?pl - airplane ?loc - location)
    :precondition (and (in ?p ?pl) (at ?pl ?loc))
    :effect (and (p-at ?p ?loc) (not (in ?p ?pl)) (plane-free ?pl))
  )
)