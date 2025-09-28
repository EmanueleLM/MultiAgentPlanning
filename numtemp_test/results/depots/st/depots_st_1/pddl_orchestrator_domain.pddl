(define (domain hoist-truck-timelogistics)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types
    hoist truck place crate pallet - entity
    entity
  )

  (:predicates
    (at ?e - entity ?p - place)            ; entity (hoist, truck, crate, pallet) at place
    (on ?c - crate ?s - entity)            ; crate on support (crate or pallet)
    (in ?c - crate ?t - truck)             ; crate loaded in truck
    (clear ?e - entity)                    ; top of stack or empty support
    (available ?h - hoist)                 ; hoist is free/available
    (holding ?h - hoist ?c - crate)        ; hoist is holding crate
  )

  ;; Driving: trucks spend time traveling. Remove source location at start so truck is not at any place during travel.
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration 10)
    :condition (and
                 (at start (at ?tr ?from))
               )
    :effect (and
              (at start (not (at ?tr ?from)))
              (at end (at ?tr ?to))
            )
  )

  ;; Hoist lifts a crate off a support (crate or pallet). Duration 1.
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?support - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?support ?p))
                 (at start (at ?c ?p))
                 (at start (on ?c ?support))
                 (at start (clear ?c))
                 (at start (available ?h))
               )
    :effect (and
              ;; hoist becomes busy immediately and crate is removed from support/place at start
              (at start (not (available ?h)))
              (at start (not (on ?c ?support)))
              (at start (not (at ?c ?p)))
              ;; at end, hoist holds the crate; support becomes clear
              (at end (holding ?h ?c))
              (at end (clear ?support))
            )
  )

  ;; Hoist puts a held crate down onto a support (crate or pallet). Duration 1.
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?support - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?support ?p))
                 (at start (clear ?support))
               )
    :effect (and
              ;; start: hoist no longer holding (operation consumes the hold)
              (at start (not (holding ?h ?c)))
              ;; end: crate placed on support at place, support becomes not clear, crate is clear (top)
              (at end (on ?c ?support))
              (at end (at ?c ?p))
              (at end (clear ?c))
              (at end (not (clear ?support)))
              ;; hoist becomes available at end
              (at end (available ?h))
            )
  )

  ;; Hoist loads a held crate into a truck at the hoist's place. Duration 3.
  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :duration (= ?duration 3)
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
               )
    :effect (and
              ;; start: hoist stops holding (it is busy loading)
              (at start (not (holding ?h ?c)))
              (at start (not (available ?h)))
              ;; end: crate is in truck, hoist becomes available
              (at end (in ?c ?tr))
              (at end (not (at ?c ?p)))
              (at end (available ?h))
            )
  )

  ;; Hoist unloads a crate from a truck and places it onto a support. Duration 4.
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?support - entity ?p - place)
    :duration (= ?duration 4)
    :condition (and
                 (at start (in ?c ?tr))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (at ?support ?p))
                 (at start (clear ?support))
                 (at start (available ?h))
               )
    :effect (and
              ;; at start remove from truck and hoist becomes busy
              (at start (not (in ?c ?tr)))
              (at start (not (available ?h)))
              ;; at end hoist has placed crate on support and becomes available
              (at end (on ?c ?support))
              (at end (at ?c ?p))
              (at end (clear ?c))
              (at end (not (clear ?support)))
              (at end (available ?h))
            )
  )

  ;; Initialization convenience actions could be added; not needed in domain.
  (:functions (total-time))
  (:metric minimize (total-time))
)