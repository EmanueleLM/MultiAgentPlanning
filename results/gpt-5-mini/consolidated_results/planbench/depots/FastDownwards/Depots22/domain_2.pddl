(define (domain hoist-truck-warehouse)
  (:requirements :typing :negative-preconditions :strips)
  (:types place truck hoist object stage)

  (:predicates
    ;; typing markers for objects
    (is-crate ?o - object)
    (is-pallet ?o - object)
    (is-support ?o - object)   ;; pallets and crates can act as supports

    ;; spatial relations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (at ?o - object ?p - place)   ;; object (pallet or crate) is at a place
    (on ?c - object ?s - object)  ;; crate c is on support s

    ;; top-empty marker (applies to supports and crates)
    (clear ?o - object)

    ;; hoist state
    (hoist-free ?h - hoist)
    (hoist-lifting ?h - hoist ?c - object)

    ;; truck cargo
    (in-truck ?c - object ?t - truck)

    ;; discrete stage progression
    (stage ?st - stage)
    (current ?st - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Drive a truck from one place to another; advances the global stage.
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

  ;; Hoist lift: attach and lift a crate from a support at the same place; advances stage.
  (:action hoist-lift
    :parameters (?h - hoist ?c - object ?s - object ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (on ?c ?s)
      (at ?s ?p)
      (is-crate ?c)
      (is-support ?s)
      (clear ?c)
      (hoist-free ?h)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      ;; remove crate from support and from the place (now lifted)
      (not (on ?c ?s))
      (not (at ?c ?p))
      ;; hoist becomes busy and lifts the crate
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      ;; support becomes clear now that its top object removed
      (clear ?s)
      ;; advance stage
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; Hoist drop: place a lifted crate onto a support at the same place; advances stage.
  (:action hoist-drop
    :parameters (?h - hoist ?c - object ?s - object ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-lifting ?h ?c)
      (at ?s ?p)
      (is-support ?s)
      (clear ?s)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      ;; crate now sits on the support and has a place location
      (on ?c ?s)
      (at ?c ?p)
      ;; hoist no longer lifting and becomes free
      (not (hoist-lifting ?h ?c))
      (hoist-free ?h)
      ;; support top is occupied, crate is top so clear true
      (not (clear ?s))
      (clear ?c)
      ;; advance stage
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; Hoist load: put a lifted crate into a truck at same place (crate becomes in-truck); advances stage.
  (:action hoist-load
    :parameters (?h - hoist ?c - object ?t - truck ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (hoist-lifting ?h ?c)
      (is-crate ?c)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      ;; crate removed from hoist and becomes inside truck
      (not (hoist-lifting ?h ?c))
      (hoist-free ?h)
      (in-truck ?c ?t)
      ;; crate no longer has a place location while in truck
      (not (at ?c ?p))
      ;; crate in-truck considered clear (nothing on top while inside)
      (clear ?c)
      ;; advance stage
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; Hoist unload: attach and lift a crate from inside a truck; advances stage.
  (:action hoist-unload
    :parameters (?h - hoist ?c - object ?t - truck ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (in-truck ?c ?t)
      (hoist-free ?h)
      (is-crate ?c)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      ;; crate removed from truck and hoist lifts it
      (not (in-truck ?c ?t))
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      ;; advance stage
      (not (current ?st))
      (current ?nst)
    )
  )

  ;; Move hoist when free (relocate hoist while not carrying); advances stage.
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

  ;; Move hoist while lifting a crate (hoist and lifted crate move together); advances stage.
  (:action hoist-move-lifting
    :parameters (?h - hoist ?c - object ?from - place ?to - place ?st - stage ?nst - stage)
    :precondition (and
      (hoist-at ?h ?from)
      (hoist-lifting ?h ?c)
      (current ?st)
      (next ?st ?nst)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
      ;; crate remains lifted (no at/on changes here)
      (not (current ?st))
      (current ?nst)
    )
  )

)