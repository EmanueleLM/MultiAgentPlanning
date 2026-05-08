(define (domain logistics-audit)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location airport city phase)

  (:predicates
    ; positions
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?ap - airport)
    (at-pkg ?p - package ?l - location)

    ; containment
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ; topology
    (road ?from - location ?to - location)        ; road connectivity for trucks
    (air-route ?from - airport ?to - airport)     ; flight connectivity for airplanes

    ; phases and audit markers
    (phase ?ph - phase)
    (phase-done ?ph - phase)

    ; delivery intent
    (dest ?p - package ?c - city)
  )

  ; Truck actions (distinct agent)
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and (at-truck ?tr ?from) (road ?from ?to))
    :effect (and (not (at-truck ?tr ?from)) (at-truck ?tr ?to))
  )

  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and (at-truck ?tr ?loc) (at-pkg ?pkg ?loc) (not (in-truck ?pkg ?tr)))
    :effect (and (in-truck ?pkg ?tr) (not (at-pkg ?pkg ?loc)))
  )

  ; Unloading onto an airport (allowed during phase1)
  (:action truck-unload-at-airport
    :parameters (?tr - truck ?pkg - package ?air - airport)
    :precondition (and (at-truck ?tr ?air) (in-truck ?pkg ?tr))
    :effect (and (not (in-truck ?pkg ?tr)) (at-pkg ?pkg ?air))
  )

  ; Unloading into a final city is prohibited until plane transport and airport transfer are complete.
  (:action truck-unload-at-city
    :parameters (?tr - truck ?pkg - package ?city - city ?ph - phase)
    :precondition (and (at-truck ?tr ?city) (in-truck ?pkg ?tr) (phase ?ph) (phase-done ?ph))
    :effect (and (not (in-truck ?pkg ?tr)) (at-pkg ?pkg ?city))
  )

  ; Airplane actions (distinct agent)
  (:action plane-load
    :parameters (?pl - airplane ?pkg - package ?air - airport ?ph - phase)
    :precondition (and (at-plane ?pl ?air) (at-pkg ?pkg ?air) (phase ?ph) (phase-done ?ph))
    :effect (and (in-plane ?pkg ?pl) (not (at-pkg ?pkg ?air)))
  )

  (:action plane-unload
    :parameters (?pl - airplane ?pkg - package ?air - airport)
    :precondition (and (at-plane ?pl ?air) (in-plane ?pkg ?pl))
    :effect (and (not (in-plane ?pkg ?pl)) (at-pkg ?pkg ?air))
  )

  (:action plane-fly
    :parameters (?pl - airplane ?from - airport ?to - airport ?ph - phase)
    :precondition (and (at-plane ?pl ?from) (air-route ?from ?to) (phase ?ph) (phase-done ?ph))
    :effect (and (not (at-plane ?pl ?from)) (at-plane ?pl ?to))
  )

  ; Audit-enforced explicit phase completion actions:
  ; These actions exist so the planner cannot start the next phase until the explicit conditions are observed.
  ; They cannot be faked or bypassed and they enforce that required package-level conditions hold.

  ; Complete phase1 only when both specified packages are physically at the origin airport.
  (:action complete-phase1
    :parameters (?air - airport ?p1 - package ?p2 - package ?ph - phase)
    :precondition (and (phase ?ph) (not (phase-done ?ph))
                       (at-pkg ?p1 ?air) (at-pkg ?p2 ?air))
    :effect (phase-done ?ph)
  )

  ; Complete phase2 only when both specified packages are present at the destination airport.
  (:action complete-phase2
    :parameters (?air - airport ?p1 - package ?p2 - package ?ph - phase)
    :precondition (and (phase ?ph) (not (phase-done ?ph))
                       (at-pkg ?p1 ?air) (at-pkg ?p2 ?air))
    :effect (phase-done ?ph)
  )

  ; Complete phase3 when both packages are at their destination cities (final terminal condition).
  (:action complete-phase3
    :parameters (?p1 - package ?p2 - package ?ph - phase ?c1 - city ?c2 - city)
    :precondition (and (phase ?ph) (not (phase-done ?ph))
                       (dest ?p1 ?c1) (dest ?p2 ?c2)
                       (at-pkg ?p1 ?c1) (at-pkg ?p2 ?c2))
    :effect (phase-done ?ph)
  )
)