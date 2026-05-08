(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types
    place depot distributor
    hoist truck
    surface pallet crate
  )
  ;; declare subtypes
  ;; (PDDL uses the "-" notation for subtypes; repeat here for clarity)
  (:types
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (at ?s - surface ?p - place)         ; surface (pallet or crate) is at place
    (truck_at ?t - truck ?p - place)     ; truck at place
    (hoist_at ?h - hoist ?p - place)     ; hoist at place

    ;; stacking and containment
    (on ?c - crate ?s - surface)         ; crate directly on a surface (pallet or crate)
    (in_truck ?c - crate ?t - truck)     ; crate inside truck

    ;; hoist state
    (lifting ?h - hoist ?c - crate)      ; hoist is lifting crate
    (available ?h - hoist)               ; hoist is available

    ;; surface top free
    (clear ?s - surface)                 ; surface (pallet or crate) has no crate on top
  )

  ;; Action: drive a truck between places
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; Action: lift a crate from a surface at a place using a hoist
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; Action: drop a crate from a hoist to a surface at a place
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; Action: load a crate into a truck using a hoist
  ;; NOTE: The original specification provided preconditions but omitted any effects.
  ;; This action therefore preserves that omission: it has preconditions but no effects.
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      ;; Intentionally empty: the source specification did not state any effects for load.
    )
  )

  ;; Action: unload a crate from a truck using a hoist
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)