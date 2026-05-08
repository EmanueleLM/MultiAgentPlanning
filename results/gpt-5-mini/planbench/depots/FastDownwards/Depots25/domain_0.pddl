(define (domain depot_operator)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    depot distributor - place
    pallet crate - surface
    truck
    hoist
    place
    surface
  )

  ;; Concrete type predicates (explicit type tokens as requested)
  (:predicates
    (IsPlace ?p - place)
    (IsDepot ?d - depot)
    (IsDistributor ?x - distributor)

    (IsSurface ?s - surface)
    (IsPallet ?p - pallet)
    (IsCrate ?c - crate)

    (IsTruck ?t - truck)
    (IsHoist ?h - hoist)

    ;; Static road connectivity (bidirectional facts will be asserted in problem)
    (road-connected ?p1 - place ?p2 - place)

    ;; Mobile/physical location predicates
    (truck-at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    ;; surface-at applies to pallets and crates when those surfaces are located at a place
    (surface-at ?s - surface ?p - place)

    ;; stacking and top-of-stack
    (on ?crate - crate ?surface - surface)        ;; crate directly on surface (pallet or crate)
    (clear ?s - surface)                         ;; nothing directly on top of this surface
    (not-clear ?s - surface)                     ;; explicit negation token for top-of-stack

    ;; hoist state
    (hoist-available ?h - hoist)
    (holding ?h - hoist ?c - crate)              ;; hoist H holds crate C

    ;; truck contents
    (crate-in-truck ?c - crate ?t - truck)
  )

  ;; ACTIONS NAMESPACED BY AGENT RESPONSIBILITY
  ;; Truck coordinator: drive actions
  (:action truck/drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
                    (truck-at ?tr ?from)
                    ;; enforce that origin and destination differ by requiring the truck to not be at the destination
                    (not (truck-at ?tr ?to))
                  )
    :effect (and
              (not (truck-at ?tr ?from))
              (truck-at ?tr ?to)
            )
  )

  ;; Hoist manager actions - hoists do not move; they only lift/drop/load/unload at their place.
  (:action hoist/lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (surface-at ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (hoist-available ?h)
                  )
    :effect (and
              ;; remove crate from its support and place representation (crate leaves the surface and place)
              (not (on ?c ?s))
              (not (surface-at ?c ?p))
              ;; hoist now holds the crate; hoist becomes unavailable
              (holding ?h ?c)
              (not (hoist-available ?h))
              ;; the support surface becomes clear; keep clear-ness tokens consistent
              (clear ?s)
              (not (not-clear ?s))
              ;; crate is held and remains clear (nothing on it)
              (clear ?c)
              (not (not-clear ?c))
            )
  )

  (:action hoist/drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (surface-at ?s ?p)
                    (holding ?h ?c)
                    (clear ?s)
                    ;; prevent trivial/direct cycles: cannot drop C onto a surface that is (directly) on C
                    (not (on ?s ?c))
                  )
    :effect (and
              ;; hoist releases crate
              (not (holding ?h ?c))
              (hoist-available ?h)

              ;; crate now directly on surface and thus located at the place
              (on ?c ?s)
              (surface-at ?c ?p)

              ;; update clear / not-clear tokens:
              ;; destination surface is no longer clear
              (not (clear ?s))
              (not-clear ?s)
              ;; new top crate is clear
              (clear ?c)
              (not (not-clear ?c))
            )
  )

  (:action hoist/load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?t ?p)
                    (holding ?h ?c)
                  )
    :effect (and
              ;; move crate into truck; hoist freed
              (not (holding ?h ?c))
              (hoist-available ?h)
              (crate-in-truck ?c ?t)

              ;; crate is no longer located at the place / on any surface while in truck
              (not (surface-at ?c ?p))

              ;; crate remains clear while inside truck (no stacking inside truck)
              (clear ?c)
              (not (not-clear ?c))
            )
  )

  (:action hoist/unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?t ?p)
                    (hoist-available ?h)
                    (crate-in-truck ?c ?t)
                  )
    :effect (and
              ;; remove from truck and hoist begins holding the crate
              (not (crate-in-truck ?c ?t))
              (holding ?h ?c)
              (not (hoist-available ?h))

              ;; the crate is now in-transit with hoist (no surface-at fact)
              (not (surface-at ?c ?p))

              ;; crate is held and therefore clear
              (clear ?c)
              (not (not-clear ?c))
            )
  )

  ;; Note: The domain explicitly maintains clear/not-clear tokens and moves surface-at facts
  ;; so that co-location preconditions (hoist-at / surface-at / truck-at) are explicit.
  ;; Actions only change the listed fluents (no hidden bookkeeping).
)