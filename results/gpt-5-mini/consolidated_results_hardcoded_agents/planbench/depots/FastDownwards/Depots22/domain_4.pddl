(define (domain hoist-truck-warehouse)
  (:requirements :typing :negative-preconditions :strips)
  (:types place truck hoist surface pallet crate stage)

  (:predicates
    ;; locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (at ?s - surface ?p - place)        ; a surface (pallet or crate) is located at a place

    ;; stacking and support
    (on ?c - crate ?s - surface)        ; crate c is on surface s (pallet or crate)
    (clear ?s - surface)                ; nothing is on this surface

    ;; hoist state
    (hoist-free ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; truck contents
    (in-truck ?c - crate ?t - truck)

    ;; discrete time / stages
    (current ?st - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; DRIVE: move truck between places; advances the global stage discretely
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?nst - stage)
    :precondition (and
      (truck-at ?tr ?from)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; HOIST LIFT: hoist picks up a crate from a surface at a place; crate is no longer on that surface or at the place;
  ;; hoist becomes non-free and is associated with that crate; surface becomes clear.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (on ?c ?s)
      (at ?s ?p)
      (clear ?c)
      (hoist-free ?h)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      (clear ?s)
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; HOIST DROP: hoist places the crate onto a surface at the same place; hoist becomes free and stops lifting;
  ;; the crate is placed on the surface and is at the place; the surface becomes not clear; the crate becomes clear.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-lifting ?h ?c)
      (at ?s ?p)
      (clear ?s)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (on ?c ?s)
      (at ?c ?p)
      (not (hoist-lifting ?h ?c))
      (hoist-free ?h)
      (not (clear ?s))
      (clear ?c)
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; HOIST LOAD: hoist places the lifted crate into a truck at the same place; crate becomes in-truck and not at place;
  ;; hoist becomes free and stops lifting (crate in truck no longer considered on a surface or at-place).
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (hoist-lifting ?h ?c)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (not (hoist-lifting ?h ?c))
      (hoist-free ?h)
      (in-truck ?c ?t)
      (not (at ?c ?p))
      ;; crate inside truck is considered to be clear (no stacking while in truck)
      (clear ?c)
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; HOIST UNLOAD: hoist takes a crate out of a truck (hoist must be free and co-located with the truck);
  ;; crate is removed from the truck and becomes attached to the hoist (lifting) and hoist becomes non-free.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (in-truck ?c ?t)
      (hoist-free ?h)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; HOIST MOVE (free): move a free hoist between places; advances stage
  (:action hoist-move-free
    :parameters (?h - hoist ?from - place ?to - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?from)
      (hoist-free ?h)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; HOIST MOVE (lifting): move a hoist while it is lifting a crate; crate remains associated with hoist (not at any place)
  (:action hoist-move-lifting
    :parameters (?h - hoist ?c - crate ?from - place ?to - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?from)
      (hoist-lifting ?h ?c)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
      (not (current ?st))
      (current ?nst)
    )
  )
)