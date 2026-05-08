(define (domain depots20)
  (:requirements :typing :negative-preconditions)
  (:types
    hoist truck
    place
    depot distributor - place
    surface
    crate pallet - surface
  )

  (:predicates
    ;; locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (crate-at ?c - crate ?p - place)
    (surface-at ?s - surface ?p - place)
    (road ?from - place ?to - place)

    ;; stacking & surfaces
    (on ?c - crate ?s - surface)
    (clear ?s - surface)

    ;; hoist & truck state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
    (in-truck ?c - crate ?tr - truck)
  )

  ;; Drive a truck along a road between places
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?tr ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Move a hoist between places (use road connectivity)
  (:action hoist-move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (and
      (hoist-at ?h ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at the hoist's place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (crate-at ?c ?p)
      (on ?c ?s)
      (hoist-available ?h)
      (clear ?c)
    )
    :effect (and
      ;; crate removed from surface and place (lifted)
      (not (on ?c ?s))
      (not (crate-at ?c ?p))
      ;; hoist becomes busy and is lifting the crate
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      ;; the surface becomes clear after lift
      (clear ?s)
    )
  )

  ;; Hoist drops a lifted crate to a surface at the place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (hoist-lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      ;; crate placed back on surface and at place
      (on ?c ?s)
      (crate-at ?c ?p)
      ;; hoist becomes available and stops lifting
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      ;; surface is no longer clear, crate top is clear
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      ;; crate is moved into the truck
      (in-truck ?c ?tr)
      ;; crate is no longer in the place (already removed at lift)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist becomes busy and holds the crate)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-available ?h)
      (in-truck ?c ?tr)
    )
    :effect (and
      ;; crate removed from truck and hoist holds it (not yet on a surface)
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
    )
  )
)