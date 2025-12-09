(define (domain transport-audit)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle truck airplane
    equipment
    cargo
    location
    phase
  )
  (:predicates
    ;; location predicates for vehicles and equipment
    (at ?x - (either vehicle equipment) ?l - location)

    ;; cargo location and mounting
    (cargo-at ?c - cargo ?l - location)
    (on ?c - cargo ?v - vehicle)

    ;; safety / readiness predicates
    (loader-inspected ?ldr - equipment)
    (plane-fueled ?p - airplane)

    ;; phase sequencing predicates
    (current-phase ?ph - phase)
    (phase-next ?ph1 - phase ?ph2 - phase)

    ;; role labels that bind specific phases to particular tasks (enforce exact ordering)
    (phase-is-inspect ?ph - phase)
    (phase-is-load-truck ?ph - phase)
    (phase-is-drive-to-airport ?ph - phase)
    (phase-is-load-airplane ?ph - phase)
    (phase-is-fuel ?ph - phase)
    (phase-is-fly ?ph - phase)
    (phase-is-drive-to-airport2 ?ph - phase)
    (phase-is-unload-airplane ?ph - phase)
    (phase-is-drive-to-dest ?ph - phase)
    (phase-is-unload-truck ?ph - phase)
    (phase-is-done ?ph - phase)
  )

  ;; 1) Loader inspection must occur in the inspection phase; advances the global phase.
  (:action inspect-loader
    :parameters (?ldr - equipment ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-inspect ?ph)
                    (not (loader-inspected ?ldr))
                  )
    :effect (and
              (loader-inspected ?ldr)
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )

  ;; 2) Load cargo onto a truck at a location (warehouse). Distinct truck loading action.
  (:action load-truck
    :parameters (?t - truck ?c - cargo ?loc - location ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-load-truck ?ph)
                    (at ?t ?loc)
                    (cargo-at ?c ?loc)
                  )
    :effect (and
              (on ?c ?t)
              (not (cargo-at ?c ?loc))
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )

  ;; 3) Drive a truck between locations (used for truck that takes cargo to airport).
  (:action drive-truck-to-airport
    :parameters (?t - truck ?from - location ?to - location ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-drive-to-airport ?ph)
                    (at ?t ?from)
                  )
    :effect (and
              (at ?t ?to)
              (not (at ?t ?from))
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )

  ;; 4) Loader loads cargo from a truck to an airplane at a common location.
  (:action load-airplane
    :parameters (?ldr - equipment ?t - truck ?p - airplane ?c - cargo ?loc - location ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-load-airplane ?ph)
                    (loader-inspected ?ldr)
                    (at ?ldr ?loc)
                    (at ?t ?loc)
                    (at ?p ?loc)
                    (on ?c ?t)
                  )
    :effect (and
              (on ?c ?p)
              (not (on ?c ?t))
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )

  ;; 5) Fuel the airplane before flight (distinct airplane preparation).
  (:action fuel-airplane
    :parameters (?p - airplane ?loc - location ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-fuel ?ph)
                    (at ?p ?loc)
                  )
    :effect (and
              (plane-fueled ?p)
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )

  ;; 6) Fly airplane from one location to another with cargo mounted. Must be fueled.
  (:action fly-airplane
    :parameters (?p - airplane ?from - location ?to - location ?c - cargo ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-fly ?ph)
                    (at ?p ?from)
                    (plane-fueled ?p)
                    (on ?c ?p)
                  )
    :effect (and
              (at ?p ?to)
              (not (at ?p ?from))
              (not (plane-fueled ?p))
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )

  ;; 7) Drive a second truck (receiving truck) to the destination airport where the plane will land.
  (:action drive-truck2-to-airport
    :parameters (?t - truck ?from - location ?to - location ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-drive-to-airport2 ?ph)
                    (at ?t ?from)
                  )
    :effect (and
              (at ?t ?to)
              (not (at ?t ?from))
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )

  ;; 8) Loader unloads cargo from airplane to a truck at the arrival airport. Requires inspected loader.
  (:action unload-airplane-to-truck
    :parameters (?ldr - equipment ?p - airplane ?t - truck ?c - cargo ?loc - location ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-unload-airplane ?ph)
                    (loader-inspected ?ldr)
                    (at ?ldr ?loc)
                    (at ?t ?loc)
                    (at ?p ?loc)
                    (on ?c ?p)
                  )
    :effect (and
              (on ?c ?t)
              (not (on ?c ?p))
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )

  ;; 9) Drive the receiving truck from the arrival airport to the final depot with the cargo.
  (:action drive-truck-to-dest
    :parameters (?t - truck ?from - location ?to - location ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-drive-to-dest ?ph)
                    (at ?t ?from)
                  )
    :effect (and
              (at ?t ?to)
              (not (at ?t ?from))
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )

  ;; 10) Unload cargo from truck to final depot location (terminal condition). Advances to done phase.
  (:action unload-truck
    :parameters (?t - truck ?c - cargo ?loc - location ?ph - phase ?phn - phase)
    :precondition (and
                    (current-phase ?ph)
                    (phase-next ?ph ?phn)
                    (phase-is-unload-truck ?ph)
                    (at ?t ?loc)
                    (on ?c ?t)
                  )
    :effect (and
              (cargo-at ?c ?loc)
              (not (on ?c ?t))
              (not (current-phase ?ph))
              (current-phase ?phn)
            )
  )
)