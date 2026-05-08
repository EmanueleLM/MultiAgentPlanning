(define (domain depots)
  (:requirements :strips :typing)
  (:types crate pallet - surface place truck hoist)

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)     ; truck ?tr is at place ?p
    (hoist-at ?h - hoist ?p - place)      ; hoist ?h is at place ?p
    (at ?s - surface ?p - place)          ; surface (pallet or crate) is at place

    ;; containment / stacking
    (on ?c - crate ?s - surface)          ; crate ?c is directly on surface ?s (pallet or crate)
    (in ?c - crate ?tr - truck)           ; crate ?c is inside truck ?tr

    ;; hoist state
    (hoist-free ?h - hoist)               ; hoist is available
    (hoist-holding ?h - hoist ?c - crate) ; hoist holds crate

    ;; surface clearance (nothing on top)
    (clear ?s - surface)
  )

  ;; Drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place (crate removed from surface and place; hoist becomes occupied)
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-free ?h)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (hoist-free ?h))
      (not (on ?c ?s))
      (not (at ?c ?p))
      (clear ?s)
    )
  )

  ;; Hoist drops a held crate onto a surface at the same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (hoist-free ?h)
      (not (hoist-holding ?h ?c))
      (on ?c ?s)
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place (crate becomes in-truck; crate no longer at place)
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (at-truck ?tr ?p)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (not (at ?c ?p))
      (hoist-free ?h)
      (not (hoist-holding ?h ?c))
    )
  )

  ;; Hoist unloads a crate from a truck (hoist becomes occupied holding the crate; crate removed from truck)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (at-truck ?tr ?p)
      (hoist-free ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (in ?c ?tr))
      (hoist-holding ?h ?c)
      (not (hoist-free ?h))
    )
  )
)