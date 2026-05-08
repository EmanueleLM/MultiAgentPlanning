(define (domain depots28)
  (:requirements :strips :negative-preconditions)
  ;; Untyped (instance-specific) domain for this Depots instance.
  (:predicates
    ;; locations
    (truck-at ?tr ?p)
    (hoist-at ?h ?p)
    (at ?obj ?p)            ; object (crate or pallet) is at place
    ;; stacking / support
    (on ?top ?bottom)       ; top surface is directly on bottom surface
    (clear ?s)              ; surface has nothing on top
    ;; hoist & truck membership
    (hoist-available ?h)
    (hoist-lifting ?h ?c)   ; hoist is currently lifting crate
    (in-truck ?c ?tr)       ; crate is inside truck
  )

  ;; Drive a truck from one place to another.
  (:action drive
    :parameters (?tr ?from ?to)
    :precondition (truck-at ?tr ?from)
    :effect (and
      (truck-at ?tr ?to)
      (not (truck-at ?tr ?from))
    )
  )

  ;; Hoist: lift a crate from a supporting surface at the same place.
  (:action hoist-lift
    :parameters (?h ?p ?c ?s)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-available ?h)
      (at ?c ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; Hoist: drop a lifted crate onto a surface at the same place.
  (:action hoist-drop
    :parameters (?h ?p ?c ?s)
    :precondition (and
      (hoist-at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; Hoist: load a lifted crate into a truck at the same place.
  (:action hoist-load
    :parameters (?h ?p ?c ?tr)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
    )
  )

  ;; Hoist: unload a crate from a truck (hoist begins lifting it).
  (:action hoist-unload
    :parameters (?h ?p ?c ?tr)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-available ?h)
      (in-truck ?c ?tr)
      (truck-at ?tr ?p)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
    )
  )
)