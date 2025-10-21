(define (domain multi_agent_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent package vehicle location object)

  ; Normalization notes:
  ; - A single predicate (holding ?a - agent ?p - package) represents any agent carrying a package.
  ; - A single predicate (in ?p - package ?v - vehicle) represents packages loaded in vehicles.
  ; - Predicates and actions were named to keep distinct responsibilities: pickup/drop for hand-carry,
  ;   load-into-vehicle/unload-from-vehicle for vehicle transfers, and drive-vehicle for relocating vehicles.
  ; - All movable entities (agents, packages, vehicles) use the generic (at ?x - object ?loc - location) predicate.

  (:predicates
    (at ?x - object ?loc - location)
    (holding ?a - agent ?p - package)
    (in ?p - package ?v - vehicle)
    (free ?a - agent)
  )

  ; Move an agent on foot between locations
  (:action move-agent
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and (at ?a ?from))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  ; Drive a vehicle (agent moves together with vehicle)
  (:action drive-vehicle
    :parameters (?a - agent ?v - vehicle ?from - location ?to - location)
    :precondition (and (at ?a ?from) (at ?v ?from))
    :effect (and
              (not (at ?a ?from)) (at ?a ?to)
              (not (at ?v ?from)) (at ?v ?to)
            )
  )

  ; Agent picks up a package by hand from a location
  (:action pickup-package
    :parameters (?a - agent ?p - package ?loc - location)
    :precondition (and (at ?a ?loc) (at ?p ?loc) (free ?a))
    :effect (and (holding ?a ?p) (not (at ?p ?loc)) (not (free ?a)))
  )

  ; Agent drops a held package at current location
  (:action drop-package
    :parameters (?a - agent ?p - package ?loc - location)
    :precondition (and (holding ?a ?p) (at ?a ?loc))
    :effect (and (at ?p ?loc) (not (holding ?a ?p)) (free ?a))
  )

  ; Agent loads a held package into a vehicle at the same location
  (:action load-into-vehicle
    :parameters (?a - agent ?p - package ?v - vehicle ?loc - location)
    :precondition (and (at ?a ?loc) (at ?v ?loc) (holding ?a ?p))
    :effect (and (in ?p ?v) (not (holding ?a ?p)) (free ?a))
  )

  ; Agent unloads a package from a vehicle at the same location
  (:action unload-from-vehicle
    :parameters (?a - agent ?p - package ?v - vehicle ?loc - location)
    :precondition (and (at ?a ?loc) (at ?v ?loc) (in ?p ?v))
    :effect (and (at ?p ?loc) (not (in ?p ?v)))
  )
)