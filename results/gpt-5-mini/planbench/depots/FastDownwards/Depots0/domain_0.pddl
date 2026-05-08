(define (domain multiagent_handling)
  (:requirements :strips :typing)
  (:types driver hoist vehicle crate pallet location)

  (:predicates
    ;; locations
    (at-driver ?d - driver ?l - location)
    (at-vehicle ?v - vehicle ?l - location)
    (at-hoist ?h - hoist ?l - location)
    (at-crate ?c - crate ?l - location)
    (at-pallet ?p - pallet ?l - location)

    ;; possessions / load state
    (vehicle-empty ?v - vehicle)
    (in-vehicle ?c - crate ?v - vehicle)
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; goal relation: crate placed onto a pallet
    (crate-on-pallet ?c - crate ?p - pallet)
  )

  ;; Driver actions namespace: driver_*
  (:action driver_drive
    :parameters (?d - driver ?v - vehicle ?from - location ?to - location)
    :precondition (and
                    (at-driver ?d ?from)
                    (at-vehicle ?v ?from)
                  )
    :effect (and
              (not (at-driver ?d ?from))
              (not (at-vehicle ?v ?from))
              (at-driver ?d ?to)
              (at-vehicle ?v ?to)
            )
  )

  (:action driver_load
    :parameters (?d - driver ?v - vehicle ?c - crate ?loc - location)
    :precondition (and
                    (at-driver ?d ?loc)
                    (at-vehicle ?v ?loc)
                    (at-crate ?c ?loc)
                    (vehicle-empty ?v)
                  )
    :effect (and
              (not (at-crate ?c ?loc))
              (not (vehicle-empty ?v))
              (in-vehicle ?c ?v)
            )
  )

  (:action driver_unload_onto_pallet
    :parameters (?d - driver ?v - vehicle ?c - crate ?p - pallet ?loc - location)
    :precondition (and
                    (at-driver ?d ?loc)
                    (at-vehicle ?v ?loc)
                    (in-vehicle ?c ?v)
                    (at-pallet ?p ?loc)
                  )
    :effect (and
              (not (in-vehicle ?c ?v))
              (vehicle-empty ?v)
              (crate-on-pallet ?c ?p)
            )
  )

  ;; Hoist actions namespace: hoist_*
  (:action hoist_pick
    :parameters (?h - hoist ?c - crate ?loc - location)
    :precondition (and
                    (at-hoist ?h ?loc)
                    (at-crate ?c ?loc)
                    (hoist-free ?h)
                  )
    :effect (and
              (hoist-holding ?h ?c)
              (not (hoist-free ?h))
              (not (at-crate ?c ?loc))
            )
  )

  (:action hoist_move
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (and
                    (at-hoist ?h ?from)
                  )
    :effect (and
              (not (at-hoist ?h ?from))
              (at-hoist ?h ?to)
            )
  )

  (:action hoist_place_onto_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?loc - location)
    :precondition (and
                    (at-hoist ?h ?loc)
                    (hoist-holding ?h ?c)
                    (at-pallet ?p ?loc)
                  )
    :effect (and
              (crate-on-pallet ?c ?p)
              (hoist-free ?h)
              (not (hoist-holding ?h ?c))
            )
  )
)