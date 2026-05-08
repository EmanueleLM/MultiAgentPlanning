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
    ;; connectivity among places
    (reachable ?from - place ?to - place)

    ;; truck location
    (at ?tr - truck ?pl - place)

    ;; hoist location and state
    (hoist-at ?h - hoist ?pl - place)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; surfaces and crates at places
    (surface-at ?s - surface ?pl - place)    ;; surface (pallet or crate) is at a place
    (crate-at ?c - crate ?pl - place)        ;; crate located at a place (when on a surface at that place)
    (on ?c - crate ?s - surface)             ;; crate c is directly on surface s
    (clear ?s - surface)                     ;; surface (pallet or crate) has nothing on top

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
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))

      ;; crate removed from the place / surface while held
      (not (crate-at ?c ?p))
      (not (on ?c ?s))

      ;; crate no longer acts as a surface at that place while held
      (not (surface-at ?c ?p))

      ;; underlying surface becomes clear
      (clear ?s)

      ;; held crate remains clear (topmost while held)
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
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)

      (on ?c ?s)
      (crate-at ?c ?p)
      (surface-at ?c ?p)

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
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)

      ;; crate no longer at the place / acting as surface while in truck
      (not (crate-at ?c ?p))
      (not (surface-at ?c ?p))

      ;; crate in truck is considered topmost in truck (no on relation)
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
      (not (in-truck ?c ?tr))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))

      ;; crate is held by hoist; not at place until dropped
      (not (crate-at ?c ?p))
      (not (surface-at ?c ?p))

      ;; held crate is clear
      (clear ?c)
    )
  )
)