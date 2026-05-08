(define (domain logistics-audit)
  (:requirements :strips :typing :negative-preconditions)
  (:types airport city - location
          truck airplane package phase)

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?ap - airport)
    (at-pkg ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (road ?from - location ?to - location)
    (air-route ?from - airport ?to - airport)
    (phase-done ?ph - phase)
    (dest ?p - package ?c - city)
  )

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

  (:action truck-unload-at-airport
    :parameters (?tr - truck ?pkg - package ?air - airport)
    :precondition (and (at-truck ?tr ?air) (in-truck ?pkg ?tr))
    :effect (and (not (in-truck ?pkg ?tr)) (at-pkg ?pkg ?air))
  )

  (:action truck-unload-at-city
    :parameters (?tr - truck ?pkg - package ?city - city ?ph - phase)
    :precondition (and (at-truck ?tr ?city) (in-truck ?pkg ?tr) (phase-done ?ph))
    :effect (and (not (in-truck ?pkg ?tr)) (at-pkg ?pkg ?city))
  )

  (:action plane-load
    :parameters (?pl - airplane ?pkg - package ?air - airport ?ph - phase)
    :precondition (and (at-plane ?pl ?air) (at-pkg ?pkg ?air) (phase-done ?ph))
    :effect (and (in-plane ?pkg ?pl) (not (at-pkg ?pkg ?air)))
  )

  (:action plane-unload
    :parameters (?pl - airplane ?pkg - package ?air - airport)
    :precondition (and (at-plane ?pl ?air) (in-plane ?pkg ?pl))
    :effect (and (not (in-plane ?pkg ?pl)) (at-pkg ?pkg ?air))
  )

  (:action plane-fly
    :parameters (?pl - airplane ?from - airport ?to - airport ?ph - phase)
    :precondition (and (at-plane ?pl ?from) (air-route ?from ?to) (phase-done ?ph))
    :effect (and (not (at-plane ?pl ?from)) (at-plane ?pl ?to))
  )

  (:action complete-phase1
    :parameters (?air - airport ?p1 - package ?p2 - package ?ph - phase)
    :precondition (and (not (phase-done ?ph)) (at-pkg ?p1 ?air) (at-pkg ?p2 ?air))
    :effect (phase-done ?ph)
  )

  (:action complete-phase2
    :parameters (?air - airport ?p1 - package ?p2 - package ?ph - phase)
    :precondition (and (not (phase-done ?ph)) (at-pkg ?p1 ?air) (at-pkg ?p2 ?air))
    :effect (phase-done ?ph)
  )

  (:action complete-phase3
    :parameters (?p1 - package ?p2 - package ?ph - phase ?c1 - city ?c2 - city)
    :precondition (and (not (phase-done ?ph)) (dest ?p1 ?c1) (dest ?p2 ?c2) (at-pkg ?p1 ?c1) (at-pkg ?p2 ?c2))
    :effect (phase-done ?ph)
  )
)