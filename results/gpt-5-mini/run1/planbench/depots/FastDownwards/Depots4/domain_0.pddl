(define (domain logistics-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types crate hoist truck location)

  (:predicates
    ;; locations
    (at-crate ?c - crate ?l - location)
    (at-hoist ?h - hoist ?l - location)
    (at-truck ?t - truck ?l - location)

    ;; containment
    (in-truck ?c - crate ?t - truck)

    ;; hoist state
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; truck capacity (modeled as boolean: true == empty)
    (truck-empty ?t - truck)
  )

  ;; Hoist operator actions (distinct agent)
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?loc - location)
    :precondition (and
                    (at-hoist ?h ?loc)
                    (at-crate ?c ?loc)
                    (hoist-free ?h)
                  )
    :effect (and
              (not (hoist-free ?h))
              (hoist-holding ?h ?c)
              (not (at-crate ?c ?loc))
            )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?loc - location)
    :precondition (and
                    (hoist-holding ?h ?c)
                    (at-hoist ?h ?loc)
                  )
    :effect (and
              (hoist-free ?h)
              (not (hoist-holding ?h ?c))
              (at-crate ?c ?loc)
            )
  )

  ;; Truck driver actions (distinct agent)
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and
                    (at-truck ?tr ?from)
                  )
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
            )
  )

  (:action truck-load-into-truck
    :parameters (?tr - truck ?h - hoist ?c - crate ?loc - location)
    :precondition (and
                    (at-truck ?tr ?loc)
                    (at-hoist ?h ?loc)
                    (hoist-holding ?h ?c)
                    (truck-empty ?tr)
                  )
    :effect (and
              (not (hoist-holding ?h ?c))
              (hoist-free ?h)
              (in-truck ?c ?tr)
              (not (truck-empty ?tr))
            )
  )

  (:action truck-unload-from-truck
    :parameters (?tr - truck ?h - hoist ?c - crate ?loc - location)
    :precondition (and
                    (at-truck ?tr ?loc)
                    (at-hoist ?h ?loc)
                    (hoist-free ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (hoist-holding ?h ?c)
              (not (hoist-free ?h))
              (truck-empty ?tr)
            )
  )
)