(define (domain multiagent-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist crate pallet surface)

  ;; surface is a supertype for pallets and crates
  ;; declare crate and pallet as subtypes of surface by convention (objects typed accordingly in problem)

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)   ;; a surface (pallet or crate) is located at a place
    (crate-at ?c - crate ?p - place)       ;; crate is located at a place (when not in truck or held)

    ;; stacking / surface relations
    (on ?c - crate ?s - surface)           ;; crate c is on surface s (s is pallet or crate)
    (clear ?s - surface)                   ;; surface (pallet or crate) has nothing on top

    ;; hoist state
    (hoist-available ?h - hoist)
    (holding ?h - hoist ?c - crate)        ;; hoist is holding crate

    ;; truck cargo
    (in ?c - crate ?tr - truck)

    ;; road connectivity (fully-connected between depots/distributors encoded in problem)
    (road ?from - place ?to - place)

    ;; coarse synchronization: no hoist is busy (holding) at this place
    (no-hoist-busy ?p - place)
  )

  ;; -----------------------
  ;; Truck-driver action(s)
  ;; Namespaced to truck-driver to keep agents distinct
  ;; -----------------------
  (:action truck-driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (road ?from ?to)
      (no-hoist-busy ?from)
      ;; prevent no-op drive to same place (implicit by requiring at ?from; disallow if already at ?to)
      (not (at-truck ?tr ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      ;; crates in ?tr (in ...) remain unchanged by drive (they implicitly travel)
    )
  )

  ;; -----------------------
  ;; Hoist-operator actions (namespaced)
  ;; -----------------------

  ;; lift: hoist H lifts crate C which is on surface S at place P
  (:action hoist-operator-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (crate-at ?c ?p)
      (hoist-available ?h)
      (clear ?c)
      (no-hoist-busy ?p)    ;; ensure no hoist-busy currently signalled at place (consistency)
    )
    :effect (and
      (holding ?h ?c)
      (not (hoist-available ?h))
      (not (on ?c ?s))
      (clear ?s)                ;; the surface vacated by c becomes clear
      (not (crate-at ?c ?p))
      (not (surface-at ?c ?p))
      (not (no-hoist-busy ?p))  ;; hoist is now busy at place
    )
  )

  ;; load: hoist H loads held crate C into truck T at place P
  (:action hoist-operator-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (holding ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (not (holding ?h ?c))
      (hoist-available ?h)
      ;; crate no longer present as surface at place
      (not (crate-at ?c ?p))
      (not (surface-at ?c ?p))
      (no-hoist-busy ?p)   ;; hoist freed, no hoist busy at place (synchronization token)
    )
  )

  ;; unload: hoist H lifts crate C out of truck T at place P (hoist becomes holding and busy)
  (:action hoist-operator-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (hoist-available ?h)
      (in ?c ?tr)
      (no-hoist-busy ?p)    ;; require no conflicting hoist busy at place
    )
    :effect (and
      (not (in ?c ?tr))
      (holding ?h ?c)
      (not (hoist-available ?h))
      (not (no-hoist-busy ?p))  ;; hoist becomes busy at place
    )
  )

  ;; drop: hoist H drops held crate C onto surface S at place P
  (:action hoist-operator-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (surface-at ?s ?p)
      (clear ?s)
      (holding ?h ?c)
    )
    :effect (and
      (hoist-available ?h)
      (not (holding ?h ?c))
      (crate-at ?c ?p)
      (surface-at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
      (no-hoist-busy ?p)    ;; hoist freed, signal no hoist busy at place
    )
  )
)