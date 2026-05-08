(define (domain depots-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    hoist
    object
    pallet crate truck - object
  )

  (:predicates
    ;; location of objects that can act as supports (pallets, crates, trucks)
    (at ?o - object ?p - place)

    ;; location of hoists
    (at_hoist ?h - hoist ?p - place)

    ;; stacking / containment: crate is on a support object (pallet, crate, or truck)
    (on ?c - crate ?s - object)

    ;; hoist state
    (holding ?h - hoist ?c - crate)   ; hoist holds crate
    (free_hoist ?h - hoist)           ; hoist is available (not holding)

    ;; support clearance: nothing on top of this support object
    (clear ?s - object)
  )

  ;; drive a truck between places
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
    :precondition (at_hoist ?h ?from)
    :effect (and
              (not (at_hoist ?h ?from))
              (at_hoist ?h ?to)
            )
  )

  ;; hoist lifts a crate from a support at the same place
  ;; pre: hoist and support at same place, crate on that support, hoist free, crate clear
  ;; effect: crate removed from support, hoist holds crate (becomes busy), support becomes clear,
  ;;         crate is no longer recorded at the place while being hoisted
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?sup - object ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at ?sup ?p)
                    (on ?c ?sup)
                    (free_hoist ?h)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?sup))
              (holding ?h ?c)
              (not (free_hoist ?h))
              (clear ?sup)
              (not (at ?c ?p))
            )
  )

  ;; hoist drops a held crate onto a support at the same place
  ;; pre: hoist and support co-located, support clear, hoist holding crate
  ;; effect: crate on support, hoist becomes free, support not clear, crate becomes clear,
  ;;         crate is recorded at the place
  (:action hoist-drop-to-support
    :parameters (?h - hoist ?c - crate ?sup - object ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at ?sup ?p)
                    (holding ?h ?c)
                    (clear ?sup)
                  )
    :effect (and
              (on ?c ?sup)
              (not (holding ?h ?c))
              (free_hoist ?h)
              (not (clear ?sup))
              (clear ?c)
              (at ?c ?p)
            )
  )

  ;; hoist loads a held crate into a truck at the same place
  ;; pre: hoist and truck co-located, hoist holding crate
  ;; effect: crate is on the truck, hoist becomes free, crate no longer recorded at place
  (:action hoist-load-onto-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at ?t ?p)
                    (holding ?h ?c)
                  )
    :effect (and
              (on ?c ?t)
              (not (holding ?h ?c))
              (free_hoist ?h)
              (not (at ?c ?p))
            )
  )

  ;; hoist unloads a crate from a truck at the same place
  ;; pre: hoist and truck co-located, hoist free, crate on truck
  ;; effect: crate removed from truck, hoist holds crate (becomes busy)
  ;; NOTE: crate is not yet placed on a surface (no (at ...) added) until dropped
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at ?t ?p)
                    (free_hoist ?h)
                    (on ?c ?t)
                  )
    :effect (and
              (not (on ?c ?t))
              (holding ?h ?c)
              (not (free_hoist ?h))
            )
  )
)