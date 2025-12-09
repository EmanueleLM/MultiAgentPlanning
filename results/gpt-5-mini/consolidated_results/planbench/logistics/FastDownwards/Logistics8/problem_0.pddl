(define (problem multiagent-transport-instance)
  (:domain multiagent-transport)

  (:objects
    ;; vehicles
    t1 t2 - truck
    p1 - plane

    ;; cargos
    c1 c2 - cargo

    ;; locations (road locations and airports)
    r1 r2 r3 - roadloc
    airportA airportB - airport

    ;; days / phases
    day1 day2 day3 - day
  )

  (:init
    ;; classification of locations
    (road-loc r1) (road-loc r2) (road-loc r3)
    (airport-loc airportA) (airport-loc airportB)

    ;; initial vehicle locations (at start of day1)
    (at t1 r1)
    (at t2 r2)
    (at p1 airportA)

    ;; initial cargo locations
    (at c1 r1)    ;; c1 must be delivered to r3 by end
    (at c2 r2)    ;; c2 must be delivered to airportB by end

    ;; connectivity for trucks (road network + links to airports where trucks may deliver/pickup)
    ;; Only these listed connections exist; planner cannot assume others.
    (connected-road r1 r2)
    (connected-road r2 r1)
    (connected-road r2 r3)
    (connected-road r3 r2)
    (connected-road r2 airportA)
    (connected-road airportA r2)
    (connected-road r3 airportB)
    (connected-road airportB r3)

    ;; connectivity for planes (air network only between airports)
    (connected-air airportA airportB)
    (connected-air airportB airportA)

    ;; day sequencing (explicit contiguous phases)
    (succ day1 day2)
    (succ day2 day3)

    ;; starting phase
    (now-day day1)
  )

  (:goal (and
    ;; final time condition: planner must advance to final phase day3
    (now-day day3)

    ;; mandated terminal conditions (all hard constraints)
    ;; c1 must be at road location r3 by end
    (at c1 r3)

    ;; c2 must be at airportB by end
    (at c2 airportB)

    ;; cargos cannot remain inside vehicles at the end: ensure they are on ground
    (not (in c1 t1))
    (not (in c1 t2))
    (not (in c1 p1))
    (not (in c2 t1))
    (not (in c2 t2))
    (not (in c2 p1))
  ))