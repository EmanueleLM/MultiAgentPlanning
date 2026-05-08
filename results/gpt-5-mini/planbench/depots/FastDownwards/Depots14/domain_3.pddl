(define (domain hoist-truck-domain)
  (:requirements :strips :negative-preconditions)
  ;; Untyped (no :typing) version to avoid type-declaration mismatches.
  (:predicates
    ;; locations
    (at-truck ?tr ?p)
    (at-hoist  ?h ?p)
    (at-surface ?s ?p)

    ;; stacking / containment
    (on ?c ?s)
    (in-truck ?c ?tr)

    ;; hoist state
    (hoist-available ?h)
    (hoist-lifting ?h ?c)

    ;; surface / crate clearance (nothing on top)
    (clear ?s)
  )

  ;; drive: move a truck from one place to another
  (:action drive
    :parameters (?tr ?from ?to)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; hoist-lift: hoist lifts a crate from a surface at a place
  ;; Preconditions: hoist at same place, hoist available, surface is at place, crate on that surface, crate clear.
  ;; Effects: crate is no longer on the surface nor at the place, hoist is lifting the crate and not available, surface becomes clear.
  (:action hoist-lift
    :parameters (?h ?c ?s ?p)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-available ?h)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at-surface ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
    )
  )

  ;; hoist-drop: hoist drops a lifted crate onto a surface at the same place
  ;; Preconditions: hoist at place, hoist lifting the crate, surface at place and clear.
  ;; Effects: crate is on surface and at place, crate becomes clear, surface becomes not clear, hoist becomes available and not lifting.
  (:action hoist-drop
    :parameters (?h ?c ?s ?p)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-lifting ?h ?c)
      (at-surface ?s ?p)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (at-surface ?c ?p)
      (clear ?c)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; hoist-load: hoist places a lifted crate into a truck at the same place
  ;; Preconditions: hoist at place, hoist lifting crate, truck at place.
  ;; Effects: crate becomes in the truck, hoist stops lifting and becomes available.
  (:action hoist-load
    :parameters (?h ?c ?tr ?p)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-lifting ?h ?c)
      (at-truck ?tr ?p)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
    )
  )

  ;; hoist-unload: hoist removes a crate from a truck and begins lifting it
  ;; Preconditions: hoist at place, hoist available, truck at place, crate in the truck.
  ;; Effects: crate no longer in truck, hoist begins lifting the crate and becomes not available.
  (:action hoist-unload
    :parameters (?h ?c ?tr ?p)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-available ?h)
      (at-truck ?tr ?p)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
    )
  )
)