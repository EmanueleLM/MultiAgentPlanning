(define (domain orchestrator)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :equality :numbers)
  (:types
    truck hoist crate pallet place - object
    object
  )

  (:predicates
    (truck ?t - truck)
    (hoist ?h - hoist)
    (crate ?c - crate)
    (pallet ?p - pallet)
    (place ?pl - place)

    ;; location predicates
    (at ?x - (either truck hoist crate pallet) ?pl - place) ; objects that can be at places
    ;; stacking / containment
    (on ?c - crate ?s - (either crate pallet))  ; crate on another crate or on pallet
    (in ?c - crate ?t - truck)                  ; crate inside / loaded into truck

    ;; resource / status predicates
    (clear ?s - (either crate pallet))         ; surface has nothing on top
    (available ?h - hoist)                     ; hoist is free/available to start operations
    (holding ?h - hoist ?c - crate)            ; hoist currently holding a crate
  )

  (:functions
    (dist ?from - place ?to - place)  ; distance between places
    (speed ?t - truck)                ; truck speed
    (power ?h - hoist)                ; hoist power
    (weight ?c - crate)               ; crate weight
    (total-time)                      ; objective numeric fluent to minimize (sum of action durations)
  )

  ;; Driving: trucks are not at any place while driving; duration = dist(from,to)/speed(truck)
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (dist ?from ?to) (speed ?tr)))
    :condition (and
                 (at start (at ?tr ?from))
                 (over all (not (in ?tr ?to))) ;; no additional constraints; placeholder to emphasize continuity
               )
    :effect (and
              (at start (not (at ?tr ?from)))        ; not at origin while driving
              (at end (at ?tr ?to))                  ; at destination after driving
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist lift: pick up a crate from a surface (crate or pallet). Duration = 1.
  ;; Preconditions: hoist and crate at same place, crate is top (clear), hoist available.
  ;; Effects: crate removed from surface at start, hoist becomes unavailable at start; hoist holds crate at end; underlying surface becomes clear at end.
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?pl - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (hoist ?h))
                 (at start (crate ?c))
                 (at start (at ?h ?pl))
                 (at start (at ?c ?pl))
                 (at start (on ?c ?s))
                 (at start (clear ?c))
                 (at start (available ?h))
               )
    :effect (and
              ;; start effects: begin using hoist and remove stacking relation
              (at start (not (on ?c ?s)))
              (at start (not (clear ?c)))
              (at start (not (available ?h)))

              ;; end effects: hoist holds crate and underlying surface is clear; time accounted
              (at end (holding ?h ?c))
              (at end (clear ?s))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist putdown: put a held crate onto a surface (crate or pallet). Duration = 1.
  ;; Preconditions: hoist holding crate and hoist & surface at same place.
  ;; Effects: crate placed on surface at end, hoist becomes available at end, surface becomes not clear at start.
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?pl - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (hoist ?h))
                 (at start (crate ?c))
                 (at start (at ?h ?pl))
                 (at start (at ?s ?pl))
                 (at start (holding ?h ?c))
               )
    :effect (and
              ;; start: hoist releases holding state is planned (we mark surface as being occupied)
              (at start (not (holding ?h ?c)))
              (at start (not (clear ?s)))

              ;; end: crate on surface, crate is now top (clear), hoist available; increment time
              (at end (on ?c ?s))
              (at end (available ?h))
              (at end (clear ?c))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist load: combined operation to lift+place crate into a truck (when truck is at same place).
  ;; Duration = 1 (lift) + weight(crate)/power(hoist) (load)
  ;; Preconditions: crate on a surface at the same place as hoist & truck; hoist must be available and crate clear.
  ;; Effects: crate removed from surface at start, hoist becomes unavailable at start, crate ends up in truck, underlying surface becomes clear, hoist available at end.
  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?tr - truck ?pl - place)
    :duration (= ?duration (+ 1 (/ (weight ?c) (power ?h))))
    :condition (and
                 (at start (hoist ?h))
                 (at start (crate ?c))
                 (at start (truck ?tr))
                 (at start (at ?h ?pl))
                 (at start (at ?s ?pl))
                 (at start (at ?tr ?pl))
                 (at start (on ?c ?s))
                 (at start (clear ?c))
                 (at start (available ?h))
               )
    :effect (and
              (at start (not (on ?c ?s)))
              (at start (not (available ?h)))
              (at start (not (clear ?c)))

              (at end (in ?c ?tr))
              (at end (available ?h))
              (at end (clear ?s))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist unload: combined operation to remove a crate from truck and put onto a surface.
  ;; Duration = 1 (putdown) + weight(crate)/power(hoist) (unload)
  ;; Preconditions: crate in truck and truck, hoist and surface at same place; hoist available and target surface clear.
  ;; Effects: crate removed from truck at start, marked on surface at end, hoist becomes available at end.
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?s - (either crate pallet) ?pl - place)
    :duration (= ?duration (+ 1 (/ (weight ?c) (power ?h))))
    :condition (and
                 (at start (hoist ?h))
                 (at start (crate ?c))
                 (at start (truck ?tr))
                 (at start (at ?h ?pl))
                 (at start (at ?s ?pl))
                 (at start (at ?tr ?pl))
                 (at start (in ?c ?tr))
                 (at start (available ?h))
                 (at start (clear ?s))
               )
    :effect (and
              (at start (not (in ?c ?tr)))
              (at start (not (available ?h)))
              (at start (not (clear ?s)))

              (at end (on ?c ?s))
              (at end (available ?h))
              (at end (clear ?c))
              (at end (increase (total-time) ?duration))
            )
  )
)