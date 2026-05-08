(define (domain orchestrator-domain)
  (:requirements :strips :typing)
  (:types
    place depot distributor
    surface crate pallet
    truck hoist
    place-type
  )

  (:predicates
    ;; place / connectivity / typing
    (reachable ?from - place ?to - place)
    (place_type ?p - place ?pt - place-type)

    ;; truck location (unique per truck invariant enforced by effects)
    (at ?tr - truck ?pl - place)

    ;; hoist location and state
    (hoist-at ?h - hoist ?pl - place)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; crates and surfaces
    (crate-at ?c - crate ?pl - place)        ;; crate is located at a place (when on a surface or pallet)
    (surface-at ?s - surface ?pl - place)    ;; surface (pallet or crate) is at a place
    (on ?c - crate ?s - surface)             ;; crate c is directly on surface s
    (clear ?s - surface)                     ;; surface (pallet or crate) has nothing on top

    ;; truck contents
    (in-truck ?c - crate ?tr - truck)
  )

  ;; Drive a truck from one place to another.
  ;; Preconditions: truck is at origin, the two places are reachable.
  ;; Effects: truck moves (old at deleted, new at added). No other state changed.
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
  ;; Preconditions:
  ;;   - hoist and crate and surface are co-located at P
  ;;   - crate is on that surface and crate is clear (topmost)
  ;;   - hoist is available
  ;; Effects:
  ;;   - hoist now lifts the crate (hoist-lifting)
  ;;   - hoist becomes unavailable
  ;;   - crate is no longer on the surface and is not considered at the place
  ;;   - the underlying surface S becomes clear
  ;;   - the lifted crate is no longer a surface at P (if it was)
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

      ;; crate removed from the place / surface
      (not (crate-at ?c ?p))
      (not (on ?c ?s))

      ;; crate no longer acts as a surface at that place while held
      (not (surface-at ?c ?p))

      ;; underlying surface becomes clear
      (clear ?s)

      ;; crate held by hoist is considered topmost (clear)
      (clear ?c)
    )
  )

  ;; Hoist drops a crate it is holding onto surface S at place P.
  ;; Preconditions:
  ;;   - hoist is at P and is lifting C
  ;;   - target surface S is at P and is clear
  ;; Effects:
  ;;   - crate ends up on S and at P
  ;;   - surface S becomes not clear, crate becomes clear (topmost)
  ;;   - hoist becomes available and no longer lifts the crate
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
  ;; Preconditions:
  ;;   - hoist at P, truck at P, hoist is lifting the crate.
  ;; Effects:
  ;;   - crate becomes in-truck
  ;;   - hoist becomes available and no longer lifts the crate
  ;;   - crate is not at the place or on any surface while in the truck
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
      ;; crate is no longer at the place while in truck
      (not (crate-at ?c ?p))
      ;; crate no longer acts as a surface at the place while in truck
      (not (surface-at ?c ?p))
    )
  )

  ;; Hoist takes a crate out of a truck and holds it.
  ;; Preconditions:
  ;;   - hoist at P, truck at P, hoist is available, crate is in the truck
  ;; Effects:
  ;;   - crate removed from truck (in-truck deleted)
  ;;   - hoist now lifts the crate and becomes unavailable
  ;;   - crate not at the place until dropped (hoist-lifting implies not crate-at)
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

      ;; crate is held by hoist, not at place yet
      (not (crate-at ?c ?p))
    )
  )
)