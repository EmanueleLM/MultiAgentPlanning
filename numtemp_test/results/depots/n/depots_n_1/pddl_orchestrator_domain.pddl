(define (domain multiagent-logistics-hoists)
  (:requirements :typing :fluents :negative-preconditions :numeric-fluents)
  (:types crate pallet - surface truck hoist place)

  (:predicates
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (at ?s - surface ?p - place)            ; surface located at a place
    (on ?c - crate ?s - surface)            ; crate c is on surface s (pallet or crate)
    (clear ?s - surface)                    ; surface has nothing on it
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)
    (in-truck ?c - crate ?tr - truck)
  )

  (:functions
    (fuel-cost)                             ; total fuel cost to minimize
    (load ?tr - truck)                      ; current load of a truck
    (load-limit ?tr - truck)                ; capacity limit of a truck
    (weight ?c - crate)                     ; crate weights
  )

  ;; Truck driving (agent: any truck). Driving increases fuel-cost by 10.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck-at ?tr ?from)
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
      (increase (fuel-cost) 10)
    )
  )

  ;; Hoist lift: hoist lifts a clear crate from a surface at its place.
  ;; Lifting increases fuel-cost by 1 (hoist operation cost).
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?bottom - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (at ?bottom ?p)
      (at ?c ?p)
      (on ?c ?bottom)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (not (on ?c ?bottom))
      (hoist-holding ?h ?c)
      (clear ?bottom)
      ;; crate being held is not on a surface; we keep (at ?c ?p) to indicate place
      (increase (fuel-cost) 1)
    )
  )

  ;; Hoist put: hoist places a held crate onto a clear surface at same place.
  (:action hoist-put
    :parameters (?h - hoist ?c - crate ?bottom - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-holding ?h ?c)
      (at ?bottom ?p)
      (clear ?bottom)
    )
    :effect (and
      (not (hoist-holding ?h ?c))
      (on ?c ?bottom)
      (not (clear ?bottom))
      (clear ?c)
    )
  )

  ;; Hoist load: hoist loads a held crate into a truck at same place.
  ;; Requires capacity constraint: load + weight <= load-limit.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-holding ?h ?c)
      (truck-at ?tr ?p)
      (<= (+ (load ?tr) (weight ?c)) (load-limit ?tr))
    )
    :effect (and
      (not (hoist-holding ?h ?c))
      (in-truck ?c ?tr)
      (increase (load ?tr) (weight ?c))
    )
  )

  ;; Hoist unload: hoist takes a crate from a truck and places it onto a clear surface.
  ;; Unload increases fuel-cost by 1 (hoist operation cost).
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?bottom - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (in-truck ?c ?tr)
      (at ?bottom ?p)
      (clear ?bottom)
      (hoist-available ?h)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (on ?c ?bottom)
      (not (clear ?bottom))
      (clear ?c)
      (decrease (load ?tr) (weight ?c))
      (increase (fuel-cost) 1)
    )
  )

)