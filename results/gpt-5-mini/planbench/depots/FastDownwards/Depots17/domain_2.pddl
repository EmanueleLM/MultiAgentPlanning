(define (domain depots-hoist-truck)
  (:requirements :strips :typing)
  (:types
    place
    support
    hoist
    pallet crate truck - support
  )

  (:predicates
    ;; location of supports (pallets, crates as supports, trucks)
    (at ?s - support ?p - place)
    ;; location of hoists
    (at-hoist ?h - hoist ?p - place)

    ;; stacking / containment
    (on ?c - crate ?sup - support)    ; crate is on a support (pallet, crate, or truck)

    ;; hoist state
    (holding ?h - hoist ?c - crate)   ; hoist holds crate
    (free-hoist ?h - hoist)           ; hoist is available (not holding)

    ;; support clearance (nothing on top of this support)
    (clear ?sup - support)
  )

  ;; drive a truck between places (truck is a subtype of support)
  (:action drive-truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and
              (not (at ?truck ?from))
              (at ?truck ?to)
            )
  )

  ;; move a hoist between places
  (:action hoist-move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (at-hoist ?h ?from)
    :effect (and
              (not (at-hoist ?h ?from))
              (at-hoist ?h ?to)
            )
  )

  ;; hoist lifts a crate from a support at the same place
  ;; pre: hoist and support at same place, crate on that support, hoist free, crate clear
  ;; effect: crate removed from support, hoist holds crate (becomes busy), support becomes clear
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?sup - support ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at ?sup ?p)
                    (on ?c ?sup)
                    (free-hoist ?h)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?sup))
              (holding ?h ?c)
              (not (free-hoist ?h))
              (clear ?sup)
            )
  )

  ;; hoist drops a held crate onto a support at the same place
  ;; pre: hoist and support co-located, support clear, hoist holding crate
  ;; effect: crate on support, hoist becomes free, support not clear, crate becomes clear
  (:action hoist-drop-to-support
    :parameters (?h - hoist ?c - crate ?sup - support ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at ?sup ?p)
                    (holding ?h ?c)
                    (clear ?sup)
                  )
    :effect (and
              (on ?c ?sup)
              (not (holding ?h ?c))
              (free-hoist ?h)
              (not (clear ?sup))
              (clear ?c)
            )
  )

  ;; hoist loads a held crate into a truck at the same place
  ;; pre: hoist and truck co-located, hoist holding crate
  ;; effect: crate is on the truck, hoist becomes free
  (:action hoist-load-onto-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at ?t ?p)
                    (holding ?h ?c)
                  )
    :effect (and
              (on ?c ?t)
              (not (holding ?h ?c))
              (free-hoist ?h)
            )
  )

  ;; hoist unloads a crate from a truck at the same place
  ;; pre: hoist and truck co-located, hoist free, crate on truck
  ;; effect: crate removed from truck, hoist holds crate (becomes busy)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at ?t ?p)
                    (free-hoist ?h)
                    (on ?c ?t)
                  )
    :effect (and
              (not (on ?c ?t))
              (holding ?h ?c)
              (not (free-hoist ?h))
            )
  )
)