(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle truck plane
    package
    location
    time
  )

  (:predicates
    ;; time successor
    (next ?t1 - time ?t2 - time)

    ;; agent and package locations indexed by time
    (at-vehicle ?v - vehicle ?loc - location ?t - time)
    (at-package ?p - package ?loc - location ?t - time)

    ;; package inside a vehicle at a given time slice
    (in ?p - package ?v - vehicle ?t - time)

    ;; vehicle has free capacity at given time slice (capacity = 1 enforced)
    (free ?v - vehicle ?t - time)

    ;; connectivity for movement (static)
    (connected-road ?from - location ?to - location)   ;; trucks
    (connected-air ?from - location ?to - location)    ;; planes
  )

  ;; ------------------------
  ;; Truck actions (distinct)
  ;; ------------------------

  (:action truck-load
    :parameters (?p - package ?tr - truck ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?tr ?loc ?t)
      (at-package ?p ?loc ?t)
      (free ?tr ?t)
    )
    :effect (and
      ;; package becomes inside truck at next time slice
      (in ?p ?tr ?t2)
      ;; package is no longer at location at next time slice
      (not (at-package ?p ?loc ?t2))
      ;; truck capacity becomes occupied at next time slice
      (not (free ?tr ?t2))
      ;; truck remains at same location at next time slice (unless a movement action for that vehicle is applied instead)
      (at-vehicle ?tr ?loc ?t2)
    )
  )

  (:action truck-unload
    :parameters (?p - package ?tr - truck ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?tr ?loc ?t)
      (in ?p ?tr ?t)
    )
    :effect (and
      ;; package no longer inside truck at next time slice
      (not (in ?p ?tr ?t2))
      ;; package appears at truck location at next time slice
      (at-package ?p ?loc ?t2)
      ;; truck capacity freed at next time slice
      (free ?tr ?t2)
      ;; truck remains at same location at next time slice
      (at-vehicle ?tr ?loc ?t2)
    )
  )

  (:action truck-drive-empty
    :parameters (?tr - truck ?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?tr ?from ?t)
      (connected-road ?from ?to)
      (free ?tr ?t)                ;; empty truck (capacity available)
    )
    :effect (and
      (not (at-vehicle ?tr ?from ?t2))
      (at-vehicle ?tr ?to ?t2)
      (free ?tr ?t2)
    )
  )

  (:action truck-drive-loaded
    :parameters (?p - package ?tr - truck ?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?tr ?from ?t)
      (connected-road ?from ?to)
      (in ?p ?tr ?t)               ;; specific package is inside truck
    )
    :effect (and
      (not (at-vehicle ?tr ?from ?t2))
      (at-vehicle ?tr ?to ?t2)
      ;; package remains inside truck at next time slice and thus travels with it
      (in ?p ?tr ?t2)
    )
  )

  (:action truck-wait-empty
    :parameters (?tr - truck ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?tr ?loc ?t)
      (free ?tr ?t)
    )
    :effect (and
      (at-vehicle ?tr ?loc ?t2)
      (free ?tr ?t2)
    )
  )

  (:action truck-wait-loaded
    :parameters (?p - package ?tr - truck ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?tr ?loc ?t)
      (in ?p ?tr ?t)
    )
    :effect (and
      (at-vehicle ?tr ?loc ?t2)
      (in ?p ?tr ?t2)
    )
  )

  ;; -------------------------
  ;; Airplane actions (distinct)
  ;; -------------------------

  (:action plane-load
    :parameters (?p - package ?pl - plane ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?pl ?loc ?t)
      (at-package ?p ?loc ?t)
      (free ?pl ?t)
    )
    :effect (and
      (in ?p ?pl ?t2)
      (not (at-package ?p ?loc ?t2))
      (not (free ?pl ?t2))
      (at-vehicle ?pl ?loc ?t2)
    )
  )

  (:action plane-unload
    :parameters (?p - package ?pl - plane ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?pl ?loc ?t)
      (in ?p ?pl ?t)
    )
    :effect (and
      (not (in ?p ?pl ?t2))
      (at-package ?p ?loc ?t2)
      (free ?pl ?t2)
      (at-vehicle ?pl ?loc ?t2)
    )
  )

  (:action plane-fly-empty
    :parameters (?pl - plane ?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?pl ?from ?t)
      (connected-air ?from ?to)
      (free ?pl ?t)
    )
    :effect (and
      (not (at-vehicle ?pl ?from ?t2))
      (at-vehicle ?pl ?to ?t2)
      (free ?pl ?t2)
    )
  )

  (:action plane-fly-loaded
    :parameters (?p - package ?pl - plane ?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?pl ?from ?t)
      (connected-air ?from ?to)
      (in ?p ?pl ?t)
    )
    :effect (and
      (not (at-vehicle ?pl ?from ?t2))
      (at-vehicle ?pl ?to ?t2)
      (in ?p ?pl ?t2)
    )
  )

  (:action plane-wait-empty
    :parameters (?pl - plane ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?pl ?loc ?t)
      (free ?pl ?t)
    )
    :effect (and
      (at-vehicle ?pl ?loc ?t2)
      (free ?pl ?t2)
    )
  )

  (:action plane-wait-loaded
    :parameters (?p - package ?pl - plane ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-vehicle ?pl ?loc ?t)
      (in ?p ?pl ?t)
    )
    :effect (and
      (at-vehicle ?pl ?loc ?t2)
      (in ?p ?pl ?t2)
    )
  )

  ;; -------------------------
  ;; Package persistence when not moved
  ;; -------------------------
  (:action package-wait
    :parameters (?p - package ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at-package ?p ?loc ?t)
    )
    :effect (and
      (at-package ?p ?loc ?t2)
    )
  )
)