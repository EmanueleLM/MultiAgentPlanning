(define (domain multiagent-hoist-truck)
  (:requirements :typing :fluents :negative-preconditions :equality)
  (:types place truck hoist pallet crate object) ; pallet and crate and truck and hoist are subtypes of object by convention in objects list

  (:predicates
    (at ?o - object ?p - place)            ; object at place (includes trucks, hoists, pallets, crates)
    (truck-at ?t - truck ?p - place)       ; convenience redundant info (kept for clarity)
    (hoist-at ?h - hoist ?p - place)       ; convenience redundant info
    (on ?c - crate ?s - object)            ; crate is on surface (surface is a pallet or a crate)
    (in-truck ?c - crate ?t - truck)       ; crate is in truck
    (clear ?s - object)                    ; surface (crate or pallet) has nothing on top
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
  )

  (:functions
    (current-load ?t - truck)
    (load-limit ?t - truck)
    (weight ?c - crate)
    (fuel-cost)
  )

  ;; Truck actions (distinct per truck)
  (:action drive-truck0
    :parameters (?from - place ?to - place)
    :precondition (and (at truck0 ?from) (not (= ?from ?to)))
    :effect (and
              (not (at truck0 ?from))
              (at truck0 ?to)
              (not (truck-at truck0 ?from))
              (truck-at truck0 ?to)
              (increase (fuel-cost) 10)
            )
  )

  (:action drive-truck1
    :parameters (?from - place ?to - place)
    :precondition (and (at truck1 ?from) (not (= ?from ?to)))
    :effect (and
              (not (at truck1 ?from))
              (at truck1 ?to)
              (not (truck-at truck1 ?from))
              (truck-at truck1 ?to)
              (increase (fuel-cost) 10)
            )
  )

  ;; Hoist actions - distinct per hoist (hoist0)
  (:action hoist0-lift
    :parameters (?c - crate ?s - object ?p - place)
    :precondition (and
                    (hoist-at hoist0 ?p)
                    (at ?c ?p)
                    (at ?s ?p)
                    (on ?c ?s)
                    (hoist-available hoist0)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (at ?c ?p))
              (hoist-lifting hoist0 ?c)
              (not (hoist-available hoist0))
              (clear ?s)
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist0-putdown
    :parameters (?c - crate ?s - object ?p - place)
    :precondition (and
                    (hoist-lifting hoist0 ?c)
                    (hoist-at hoist0 ?p)
                    (at ?s ?p)
                    (clear ?s)
                  )
    :effect (and
              (not (hoist-lifting hoist0 ?c))
              (hoist-available hoist0)
              (on ?c ?s)
              (at ?c ?p)
              (not (clear ?s))
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist0-load
    :parameters (?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist-lifting hoist0 ?c)
                    (hoist-at hoist0 ?p)
                    (at ?t ?p)
                    (<= (+ (current-load ?t) (weight ?c)) (load-limit ?t))
                  )
    :effect (and
              (not (hoist-lifting hoist0 ?c))
              (hoist-available hoist0)
              (in-truck ?c ?t)
              (increase (current-load ?t) (weight ?c))
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist0-unload
    :parameters (?c - crate ?t - truck ?p - place)
    :precondition (and
                    (in-truck ?c ?t)
                    (hoist-at hoist0 ?p)
                    (at ?t ?p)
                    (hoist-available hoist0)
                  )
    :effect (and
              (not (in-truck ?c ?t))
              (hoist-lifting hoist0 ?c)
              (not (hoist-available hoist0))
              (increase (current-load ?t) (- (weight ?c)))
              (increase (fuel-cost) 1)
            )
  )

  ;; Hoist actions - distinct per hoist (hoist1)
  (:action hoist1-lift
    :parameters (?c - crate ?s - object ?p - place)
    :precondition (and
                    (hoist-at hoist1 ?p)
                    (at ?c ?p)
                    (at ?s ?p)
                    (on ?c ?s)
                    (hoist-available hoist1)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (at ?c ?p))
              (hoist-lifting hoist1 ?c)
              (not (hoist-available hoist1))
              (clear ?s)
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist1-putdown
    :parameters (?c - crate ?s - object ?p - place)
    :precondition (and
                    (hoist-lifting hoist1 ?c)
                    (hoist-at hoist1 ?p)
                    (at ?s ?p)
                    (clear ?s)
                  )
    :effect (and
              (not (hoist-lifting hoist1 ?c))
              (hoist-available hoist1)
              (on ?c ?s)
              (at ?c ?p)
              (not (clear ?s))
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist1-load
    :parameters (?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist-lifting hoist1 ?c)
                    (hoist-at hoist1 ?p)
                    (at ?t ?p)
                    (<= (+ (current-load ?t) (weight ?c)) (load-limit ?t))
                  )
    :effect (and
              (not (hoist-lifting hoist1 ?c))
              (hoist-available hoist1)
              (in-truck ?c ?t)
              (increase (current-load ?t) (weight ?c))
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist1-unload
    :parameters (?c - crate ?t - truck ?p - place)
    :precondition (and
                    (in-truck ?c ?t)
                    (hoist-at hoist1 ?p)
                    (at ?t ?p)
                    (hoist-available hoist1)
                  )
    :effect (and
              (not (in-truck ?c ?t))
              (hoist-lifting hoist1 ?c)
              (not (hoist-available hoist1))
              (increase (current-load ?t) (- (weight ?c)))
              (increase (fuel-cost) 1)
            )
  )

  ;; Hoist actions - distinct per hoist (hoist2)
  (:action hoist2-lift
    :parameters (?c - crate ?s - object ?p - place)
    :precondition (and
                    (hoist-at hoist2 ?p)
                    (at ?c ?p)
                    (at ?s ?p)
                    (on ?c ?s)
                    (hoist-available hoist2)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (at ?c ?p))
              (hoist-lifting hoist2 ?c)
              (not (hoist-available hoist2))
              (clear ?s)
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist2-putdown
    :parameters (?c - crate ?s - object ?p - place)
    :precondition (and
                    (hoist-lifting hoist2 ?c)
                    (hoist-at hoist2 ?p)
                    (at ?s ?p)
                    (clear ?s)
                  )
    :effect (and
              (not (hoist-lifting hoist2 ?c))
              (hoist-available hoist2)
              (on ?c ?s)
              (at ?c ?p)
              (not (clear ?s))
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist2-load
    :parameters (?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist-lifting hoist2 ?c)
                    (hoist-at hoist2 ?p)
                    (at ?t ?p)
                    (<= (+ (current-load ?t) (weight ?c)) (load-limit ?t))
                  )
    :effect (and
              (not (hoist-lifting hoist2 ?c))
              (hoist-available hoist2)
              (in-truck ?c ?t)
              (increase (current-load ?t) (weight ?c))
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist2-unload
    :parameters (?c - crate ?t - truck ?p - place)
    :precondition (and
                    (in-truck ?c ?t)
                    (hoist-at hoist2 ?p)
                    (at ?t ?p)
                    (hoist-available hoist2)
                  )
    :effect (and
              (not (in-truck ?c ?t))
              (hoist-lifting hoist2 ?c)
              (not (hoist-available hoist2))
              (increase (current-load ?t) (- (weight ?c)))
              (increase (fuel-cost) 1)
            )
  )
)