(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    surface pallet crate
    truck hoist
  )
  (:predicates
    ;; location / containment
    (at ?obj - object ?pl - place)           ;; object (pallet, crate, truck, hoist) is at place
    (on ?c - crate ?s - surface)            ;; crate is directly on surface (pallet or crate)
    (in ?c - crate ?t - truck)              ;; crate is inside truck
    (lifting ?h - hoist ?c - crate)         ;; hoist is currently lifting crate

    ;; hoist state & resource tokens
    (available ?h - hoist)                  ;; hoist is available (idle)
    (crate_reserved ?c - crate)             ;; temporary exclusive reservation for crate (prevents double manipulation)

    ;; surface occupancy / clearance
    (clear ?s - surface)                    ;; surface has no crate directly on top
  )

  ;; TRUCK action: move truck between places (fully connected topology)
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (at ?tr ?to))    ;; prevents no-op drive when already at destination
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; HOIST actions (prefix 'hoist-' to make agent ownership explicit)
  ;; Note: actions explicitly touch only the listed predicates; frame axioms are enforced by explicit effects.

  ;; Hoist lifts a top crate from a surface at the same place: hoist becomes busy (lifting), surface becomes clear, crate no longer at place or on surface
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
      (not (crate_reserved ?c))
    )
    :effect (and
      ;; crate is removed from its support and from place while held
      (not (on ?c ?s))
      (not (at ?c ?p))

      ;; hoist state change
      (lifting ?h ?c)
      (not (available ?h))

      ;; surface becomes clear (its single top spot freed)
      (clear ?s)

      ;; reserve the crate to prevent concurrent manipulation
      (crate_reserved ?c)
    )
  )

  ;; Hoist drops the crate it is lifting onto a clear surface at the same place:
  ;; hoist becomes available, crate is placed on the surface and at the place, surface not clear, crate becomes clear (top)
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      ;; hoist no longer lifting, becomes available
      (not (lifting ?h ?c))
      (available ?h)

      ;; crate placed on surface and at place
      (on ?c ?s)
      (at ?c ?p)

      ;; occupation/clear updates
      (clear ?c)
      (not (clear ?s))

      ;; release reservation on crate
      (not (crate_reserved ?c))
    )
  )

  ;; Hoist loads a crate it is currently lifting into a truck at the same place:
  ;; crate becomes inside the truck, hoist becomes available
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      ;; crate is now inside truck (no longer at place)
      (in ?c ?t)
      (not (at ?c ?p))

      ;; hoist becomes available and stops lifting
      (not (lifting ?h ?c))
      (available ?h)

      ;; release crate reservation
      (not (crate_reserved ?c))
    )
  )

  ;; Hoist unloads a crate from a truck: crate removed from truck and hoist starts lifting it (becomes busy)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (available ?h)
      (at ?h ?p)
      (at ?t ?p)
      (in ?c ?t)
      (not (crate_reserved ?c))
    )
    :effect (and
      ;; crate removed from truck and hoist begins lifting it
      (not (in ?c ?t))
      (lifting ?h ?c)

      ;; hoist becomes unavailable
      (not (available ?h))

      ;; reserve crate during manipulation
      (crate_reserved ?c)
    )
  )
)