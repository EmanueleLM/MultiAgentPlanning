(define (domain hoist-truck-warehouse)
  (:requirements :typing :negative-preconditions :strips)
  (:types place truck hoist pallet crate stage)

  (:predicates
    ; locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (at-pallet ?pal - pallet ?pl - place)
    (at-crate ?c - crate ?pl - place)

    ; stacking and support (separate predicates to avoid type-union issues)
    (on-pallet ?c - crate ?pal - pallet)   ; crate on pallet
    (on-crate ?c - crate ?s - crate)       ; crate on another crate

    ; clear predicates for both pallets and crates
    (clear-pallet ?pal - pallet)
    (clear-crate ?c - crate)

    ; hoist state
    (hoist-free ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ; truck contents
    (in-truck ?c - crate ?t - truck)

    ; discrete time / stages
    (current ?st - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ; DRIVE: move truck between places; advances the global stage discretely
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

  ; HOIST LIFT from pallet: lift crate that is on a pallet
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (on-pallet ?c ?pal)
      (at-pallet ?pal ?p)
      (clear-crate ?c)
      (hoist-free ?h)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (not (on-pallet ?c ?pal))
      (not (at-crate ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      (clear-pallet ?pal)
      (not (current ?st))
      (current ?nst)
    )
  )

  ; HOIST LIFT from crate: lift crate that is stacked on another crate
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?sup - crate ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (on-crate ?c ?sup)
      (at-crate ?sup ?p)
      (clear-crate ?c)
      (hoist-free ?h)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (not (on-crate ?c ?sup))
      (not (at-crate ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      (clear-crate ?sup)
      (not (current ?st))
      (current ?nst)
    )
  )

  ; HOIST DROP onto pallet
  (:action hoist-drop-onto-pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-lifting ?h ?c)
      (at-pallet ?pal ?p)
      (clear-pallet ?pal)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (on-pallet ?c ?pal)
      (at-crate ?c ?p)
      (not (hoist-lifting ?h ?c))
      (hoist-free ?h)
      (not (clear-pallet ?pal))
      (clear-crate ?c)
      (not (current ?st))
      (current ?nst)
    )
  )

  ; HOIST DROP onto crate
  (:action hoist-drop-onto-crate
    :parameters (?h - hoist ?c - crate ?sup - crate ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-lifting ?h ?c)
      (at-crate ?sup ?p)
      (clear-crate ?sup)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (on-crate ?c ?sup)
      (at-crate ?c ?p)
      (not (hoist-lifting ?h ?c))
      (hoist-free ?h)
      (not (clear-crate ?sup))
      (clear-crate ?c)
      (not (current ?st))
      (current ?nst)
    )
  )

  ; HOIST LOAD: put lifted crate into truck
  (:action hoist-load-into-truck
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
      (not (at-crate ?c ?p))
      (clear-crate ?c)
      (not (current ?st))
      (current ?nst)
    )
  )

  ; HOIST UNLOAD: take a crate out of a truck and attach it to the hoist (lifting)
  (:action hoist-unload-from-truck
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

  ; HOIST MOVE (free)
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

  ; HOIST MOVE (lifting): move hoist while it is lifting a crate
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