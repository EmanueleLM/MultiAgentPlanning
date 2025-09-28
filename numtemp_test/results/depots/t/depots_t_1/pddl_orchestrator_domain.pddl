(define (domain orchestrator-domain)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :duration-inequalities)
  (:types place truck hoist crate pallet) 

  ;; Predicates
  (:predicates
    (at ?tr - truck ?p - place)                ;; truck location
    (hoist-at ?h - hoist ?p - place)          ;; hoist location (hoists don't move)
    (on ?c - crate ?s - (either crate pallet)) ;; crate c is on support s (crate or pallet)
    (in-truck ?c - crate ?tr - truck)         ;; crate is loaded in truck
    (clear ?s - (either crate pallet))        ;; surface (crate or pallet) has no crate on top and is available to receive
    (hoist-available ?h - hoist)              ;; hoist is free to use
    (surface ?x)                              ;; explicit marker for surface objects (pallets and crates)
  )

  ;; Numeric fluents / functions
  (:functions
    (speed ?tr - truck)           ;; truck speed
    (power ?h - hoist)            ;; hoist lifting power
    (weight ?c - crate)           ;; crate weight
    (distance ?from - place ?to - place)  ;; directed distance
    (total-time)                  ;; accumulated time objective to minimize
  )

  ;; Action: drive a truck between places. Duration = distance(from,to) / speed(truck)
  (:durative-action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
                 (at start (at ?tr ?from))
                )
    :effect (and
              (at start (not (at ?tr ?from)))
              (at end (at ?tr ?to))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Action: hoist loads a crate from a surface (crate or pallet) into a truck at the same place.
  ;; Duration = lift(1) + transfer(weight/power) + putdown(1) = 2 + weight(crate)/power(hoist)
  (:durative-action hoist-load-to-truck
    :parameters (?h - hoist ?tr - truck ?c - crate ?s - (either crate pallet) ?p - place)
    :duration (= ?duration (+ 2 (/ (weight ?c) (power ?h))))
    :condition (and
                 (at start (hoist-at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (on ?c ?s))
                 (at start (clear ?c))
                 (at start (hoist-available ?h))
                )
    :effect (and
              ;; reserve the hoist at start, and remove crate from support at start (begin lift)
              (at start (not (hoist-available ?h)))
              (at start (not (on ?c ?s)))
              ;; upon completion crate is in the truck and hoist becomes available again
              (at end (in-truck ?c ?tr))
              (at end (hoist-available ?h))
              ;; the support becomes clear when top crate removed; the crate itself is no longer a clear surface once in-truck
              (at end (clear ?s))
              (at end (not (clear ?c)))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Action: hoist unloads a crate from a truck onto a surface (crate or pallet) at the same place.
  ;; Duration = 2 + weight(crate)/power(hoist) (1 for lift, transfer weight/power, 1 for putdown)
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?tr - truck ?c - crate ?dest - (either crate pallet) ?p - place)
    :duration (= ?duration (+ 2 (/ (weight ?c) (power ?h))))
    :condition (and
                 (at start (hoist-at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (in-truck ?c ?tr))
                 (at start (clear ?dest))
                 (at start (hoist-available ?h))
                )
    :effect (and
              ;; reserve hoist and remove crate from truck at start (begin lift)
              (at start (not (hoist-available ?h)))
              (at start (not (in-truck ?c ?tr)))
              ;; upon completion crate is placed on destination and hoist becomes available
              (at end (on ?c ?dest))
              (at end (hoist-available ?h))
              ;; destination is no longer clear (occupied); the placed crate becomes clear (top)
              (at end (not (clear ?dest)))
              (at end (clear ?c))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoists do not move; trucks are the only movers. No explicit action for moving hoists.
)