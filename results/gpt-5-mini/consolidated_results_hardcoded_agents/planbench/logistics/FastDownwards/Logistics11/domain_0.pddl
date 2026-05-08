(define (domain transport-multimodal)
  (:requirements :strips :typing :negative-preconditions)
  (:types cargo truck airplane location stage)

  (:predicates
    ;; locations of vehicles (trucks and airplanes)
    (at ?v - (either truck airplane) ?loc - location)
    ;; cargo at a location
    (at-cargo ?c - cargo ?loc - location)
    ;; cargo loaded in a vehicle (truck or airplane)
    (in ?c - cargo ?v - (either truck airplane))
    ;; vehicle is empty (available to load)
    (empty ?v - (either truck airplane))
    ;; road connectivity between locations (used by trucks)
    (road ?from - location ?to - location)
    ;; air route between airports (used by airplanes)
    (air-route ?from - location ?to - location)
    ;; explicit stage marker to enforce ordered sequence for each cargo
    (stage ?c - cargo ?s - stage)
  )

  ;; ----------------------
  ;; Truck: load at origin city (stage s0 -> s1)
  ;; ----------------------
  (:action truck-load-origin
    :parameters (?t - truck ?c - cargo ?loc - location ?s0 - stage ?s1 - stage)
    :precondition (and
      (at ?t ?loc)
      (at-cargo ?c ?loc)
      (empty ?t)
      (stage ?c ?s0)
    )
    :effect (and
      (not (at-cargo ?c ?loc))
      (in ?c ?t)
      (not (empty ?t))
      (not (stage ?c ?s0))
      (stage ?c ?s1)
    )
  )

  ;; ----------------------
  ;; Truck: drive from a city to an airport (stage s1 -> s2)
  ;; Requires a road; removes previous location and sets new location
  ;; ----------------------
  (:action truck-drive-to-airport
    :parameters (?t - truck ?from - location ?to - location ?c - cargo ?s1 - stage ?s2 - stage)
    :precondition (and
      (at ?t ?from)
      (in ?c ?t)
      (road ?from ?to)
      (stage ?c ?s1)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (not (stage ?c ?s1))
      (stage ?c ?s2)
    )
  )

  ;; ----------------------
  ;; Truck: unload at airport (stage s2 -> s3)
  ;; ----------------------
  (:action truck-unload-at-airport
    :parameters (?t - truck ?ap - location ?c - cargo ?s2 - stage ?s3 - stage)
    :precondition (and
      (at ?t ?ap)
      (in ?c ?t)
      (stage ?c ?s2)
    )
    :effect (and
      (not (in ?c ?t))
      (at-cargo ?c ?ap)
      (empty ?t)
      (not (stage ?c ?s2))
      (stage ?c ?s3)
    )
  )

  ;; ----------------------
  ;; Airplane: load at origin airport (stage s3 -> s4)
  ;; ----------------------
  (:action airplane-load-at-origin-airport
    :parameters (?p - airplane ?c - cargo ?ap - location ?s3 - stage ?s4 - stage)
    :precondition (and
      (at ?p ?ap)
      (at-cargo ?c ?ap)
      (empty ?p)
      (stage ?c ?s3)
    )
    :effect (and
      (not (at-cargo ?c ?ap))
      (in ?c ?p)
      (not (empty ?p))
      (not (stage ?c ?s3))
      (stage ?c ?s4)
    )
  )

  ;; ----------------------
  ;; Airplane: fly from origin airport to dest airport (stage s4 -> s5)
  ;; ----------------------
  (:action airplane-fly
    :parameters (?p - airplane ?from - location ?to - location ?c - cargo ?s4 - stage ?s5 - stage)
    :precondition (and
      (at ?p ?from)
      (in ?c ?p)
      (air-route ?from ?to)
      (stage ?c ?s4)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (stage ?c ?s4))
      (stage ?c ?s5)
    )
  )

  ;; ----------------------
  ;; Airplane: unload at dest airport (stage s5 -> s6)
  ;; ----------------------
  (:action airplane-unload-at-dest-airport
    :parameters (?p - airplane ?ap - location ?c - cargo ?s5 - stage ?s6 - stage)
    :precondition (and
      (at ?p ?ap)
      (in ?c ?p)
      (stage ?c ?s5)
    )
    :effect (and
      (not (in ?c ?p))
      (at-cargo ?c ?ap)
      (empty ?p)
      (not (stage ?c ?s5))
      (stage ?c ?s6)
    )
  )

  ;; ----------------------
  ;; Truck at destination airport: load cargo (stage s6 -> s7)
  ;; ----------------------
  (:action truck-load-at-dest-airport
    :parameters (?t - truck ?ap - location ?c - cargo ?s6 - stage ?s7 - stage)
    :precondition (and
      (at ?t ?ap)
      (at-cargo ?c ?ap)
      (empty ?t)
      (stage ?c ?s6)
    )
    :effect (and
      (not (at-cargo ?c ?ap))
      (in ?c ?t)
      (not (empty ?t))
      (not (stage ?c ?s6))
      (stage ?c ?s7)
    )
  )

  ;; ----------------------
  ;; Truck drive from dest-airport to dest-city (stage s7 -> s8)
  ;; ----------------------
  (:action truck-drive-to-dest-city
    :parameters (?t - truck ?from - location ?to - location ?c - cargo ?s7 - stage ?s8 - stage)
    :precondition (and
      (at ?t ?from)
      (in ?c ?t)
      (road ?from ?to)
      (stage ?c ?s7)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (not (stage ?c ?s7))
      (stage ?c ?s8)
    )
  )

  ;; ----------------------
  ;; Truck unload at destination city (stage s8 -> s9) final step
  ;; ----------------------
  (:action truck-unload-at-dest-city
    :parameters (?t - truck ?loc - location ?c - cargo ?s8 - stage ?s9 - stage)
    :precondition (and
      (at ?t ?loc)
      (in ?c ?t)
      (stage ?c ?s8)
    )
    :effect (and
      (not (in ?c ?t))
      (at-cargo ?c ?loc)
      (empty ?t)
      (not (stage ?c ?s8))
      (stage ?c ?s9)
    )
  )
)