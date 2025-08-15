(define (domain logistics-simple)
  (:requirements :strips :typing :negative-preconditions)

  ;;; --------------------------------------------------------------
  ;;; Types
  ;;; --------------------------------------------------------------
  (:types
    truck package location
  )

  ;;; --------------------------------------------------------------
  ;;; Predicates
  ;;; --------------------------------------------------------------
  (:predicates
    ; truck or package is at a location
    (at ?obj - (either truck package) ?loc - location)

    ; package is inside a truck
    (in ?pkg - package ?truck - truck)
  )

  ;;; --------------------------------------------------------------
  ;;; Actions
  ;;; --------------------------------------------------------------
  ;--- Move the truck between the two places
  (:action move
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                    (at ?t ?from)
                    ; the two places that can be moved to/from are the only ones
                    ; (you could also make this more explicit with a “connected” predicate)
                   )
    :effect (and
              (not (at ?t ?from))
              (at ?t ?to)
            )
  )

  ;--- Load a package onto the truck (needs to be in the same place)
  (:action load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at ?t ?l)
                    (at ?p ?l)
                   )
    :effect (and
              (not (at ?p ?l))
              (in ?p ?t)
            )
  )

  ;--- Unload a package from the truck (truck must be at the house)
  (:action unload
    :parameters (?t - truck ?p - package)
    :precondition (and
                    (in ?p ?t)
                    (at ?t house)          ; only allowed to unload at the house
                   )
    :effect (and
              (not (in ?p ?t))
              (at ?p house)
            )
  )
)