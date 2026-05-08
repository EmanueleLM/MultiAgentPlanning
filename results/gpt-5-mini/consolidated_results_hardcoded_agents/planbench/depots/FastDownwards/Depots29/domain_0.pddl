(define (domain depot-hoist-operations)
  :requirements :strips :typing :negative-preconditions
  :types
    agent depot-operator hoist-operator crate pallet location hoist
  :predicates
    ; generic location predicate for all movable entities (operators, hoist, pallets, crates)
    (at ?obj - (either depot-operator hoist-operator hoist pallet crate) ?loc - location)

    ; depot operator state
    (handfree ?op - depot-operator)
    (holding ?op - depot-operator ?c - crate)

    ; hoist operator state (we do not need a separate handfree predicate for the hoist operator
    ; because hoist operations require the hoist operator to be co-located; see preconditions)
    ; hoist availability
    (hoist_free ?h - hoist)

    ; crate placement relations
    (on_hoist ?c - crate ?h - hoist)
    (attached ?c - crate ?h - hoist)
    (lifted ?c - crate)
    (on_pallet ?c - crate ?p - pallet)

    ; sequencing / stage predicates (explicit ordered phases per crate)
    (ready_for_pickup ?c - crate)       ; initial condition: crate is ready to be picked
    (stage_on_hoist ?c - crate)         ; crate has been placed onto hoist surface
    (stage_attached ?c - crate)         ; crate has been attached to the hoist hook
    (stage_lifted ?c - crate)           ; crate has been lifted by the hoist
    (stage_placed_on_pallet ?c - crate) ; crate has been placed on its destination pallet

    ; pallets are single-slot in this problem representation
    (pallet_empty ?p - pallet)
  )

  ; depot operator: move between locations
  (:action depot-move
    :parameters (?op - depot-operator ?from - location ?to - location)
    :precondition (and (at ?op ?from))
    :effect (and
              (not (at ?op ?from))
              (at ?op ?to))
  )

  ; depot operator: pick crate from its current location (ground or storage)
  (:action depot-pick
    :parameters (?op - depot-operator ?c - crate ?loc - location)
    :precondition (and
                    (at ?op ?loc)
                    (at ?c ?loc)
                    (ready_for_pickup ?c)
                    (handfree ?op))
    :effect (and
              (not (at ?c ?loc))
              (not (handfree ?op))
              (holding ?op ?c)
              (not (ready_for_pickup ?c)))
  )

  ; depot operator: place a held crate onto the hoist platform (hoist must be at same location and free)
  (:action depot-place-on-hoist
    :parameters (?op - depot-operator ?c - crate ?h - hoist ?loc - location)
    :precondition (and
                    (at ?op ?loc)
                    (at ?h ?loc)
                    (holding ?op ?c)
                    (hoist_free ?h))
    :effect (and
              (not (holding ?op ?c))
              (handfree ?op)
              (not (hoist_free ?h))
              (on_hoist ?c ?h)
              (stage_on_hoist ?c)
              ; crate is physically co-located with the hoist while on it
              (at ?c ?loc))
  )

  ; hoist operator: attach the crate (hook) once it is on the hoist platform
  (:action hoist-attach
    :parameters (?hop - hoist-operator ?h - hoist ?c - crate ?loc - location)
    :precondition (and
                    (at ?hop ?loc)
                    (at ?h ?loc)
                    (on_hoist ?c ?h)
                    (stage_on_hoist ?c)
                    (not (attached ?c ?h)))
    :effect (and
              (attached ?c ?h)
              (stage_attached ?c))
  )

  ; hoist operator: lift the attached crate (crate ceases to be at ground location while lifted)
  (:action hoist-lift
    :parameters (?hop - hoist-operator ?h - hoist ?c - crate ?loc - location)
    :precondition (and
                    (at ?hop ?loc)
                    (at ?h ?loc)
                    (attached ?c ?h)
                    (stage_attached ?c)
                    (not (lifted ?c)))
    :effect (and
              (lifted ?c)
              (stage_lifted ?c)
              (not (at ?c ?loc)))
  )

  ; hoist operator: move the hoist (and any attached & lifted crate) between locations while lifted
  (:action hoist-move
    :parameters (?hop - hoist-operator ?h - hoist ?c - crate ?from - location ?to - location)
    :precondition (and
                    (at ?hop ?from)
                    (at ?h ?from)
                    (lifted ?c)
                    (attached ?c ?h))
    :effect (and
              (not (at ?hop ?from))
              (at ?hop ?to)
              (not (at ?h ?from))
              (at ?h ?to))
  )

  ; hoist operator: lower and place the crate onto a pallet (pallet must be present at same location and empty).
  ; This action finalizes the crate placement for the crate: attached -> placed, hoist becomes free.
  (:action hoist-lower-and-place-on-pallet
    :parameters (?hop - hoist-operator ?h - hoist ?c - crate ?p - pallet ?loc - location)
    :precondition (and
                    (at ?hop ?loc)
                    (at ?h ?loc)
                    (attached ?c ?h)
                    (lifted ?c)
                    (at ?p ?loc)
                    (pallet_empty ?p))
    :effect (and
              (not (attached ?c ?h))
              (not (lifted ?c))
              (hoist_free ?h)
              (on_pallet ?c ?p)
              (stage_placed_on_pallet ?c)
              (not (on_hoist ?c ?h))
              (not (pallet_empty ?p))
              (at ?c ?loc))
  )
)