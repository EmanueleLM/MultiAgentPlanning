(define (domain depots16)
  (:requirements :strips :typing)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; connectivity among places (roads)
    (reachable ?from - place ?to - place)

    ;; truck location
    (at ?tr - truck ?pl - place)

    ;; hoist location and state
    (hoist-at ?h - hoist ?pl - place)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; surfaces and crates at places
    (surface-at ?s - surface ?pl - place)   ;; surface (pallet or crate) is at place
    (crate-at ?c - crate ?pl - place)       ;; crate located at a place (when placed on a surface at that place)
    (on ?c - crate ?s - surface)            ;; crate c is directly on surface s
    (clear ?s - surface)                    ;; surface (pallet or crate) has nothing on top

    ;; truck contents
    (in-truck ?c - crate ?tr - truck)
  )

  ;; Drive a truck from one place to another.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (reachable ?from ?to)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Hoist lifts a top-most crate C off surface S at place P and holds it.
  ;; Preconditions ensure crate is at the place on the given surface and top-most.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?p - place ?s - surface)
    :precondition (and
      (hoist-at ?h ?p)
      (crate-at ?c ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      ;; hoist holds the crate and becomes unavailable
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))

      ;; crate removed from the place / surface while held
      (not (crate-at ?c ?p))
      (not (on ?c ?s))

      ;; crate no longer acts as a surface at that place while held
      (not (surface-at ?c ?p))

      ;; underlying surface becomes clear now that top crate removed
      (clear ?s)

      ;; held crate remains top-most (clear) while held
      (clear ?c)
    )
  )

  ;; Hoist drops a crate it is holding onto surface S at place P.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-lifting ?h ?c)
      (surface-at ?s ?p)
      (clear ?s)
    )
    :effect (and
      ;; hoist stops holding and becomes available
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)

      ;; crate placed on the surface at the place
      (on ?c ?s)
      (crate-at ?c ?p)
      (surface-at ?c ?p)

      ;; surface now occupied; dropped crate is top-most
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist places a crate it currently holds into a co-located truck.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (at ?tr ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      ;; crate becomes in the truck
      (in-truck ?c ?tr)

      ;; hoist releases the crate and becomes available
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)

      ;; crate no longer at the place or acting as surface while in truck
      (not (crate-at ?c ?p))
      (not (surface-at ?c ?p))

      ;; crate is top-most in truck (conceptually clear)
      (clear ?c)
    )
  )

  ;; Hoist takes a crate out of a truck and holds it.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (at ?tr ?p)
      (hoist-available ?h)
      (in-truck ?c ?tr)
    )
    :effect (and
      ;; crate removed from truck and hoist holds it (becomes unavailable)
      (not (in-truck ?c ?tr))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))

      ;; crate is held and not yet placed at the place
      (not (crate-at ?c ?p))
      (not (surface-at ?c ?p))

      ;; held crate is topmost
      (clear ?c)
    )
  )
)