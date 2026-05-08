(define (problem logistics-multiagent-problem)
  (:domain logistics-multiagent)
  (:objects
    ;; vehicles
    truck1 truck2 - truck
    plane1 - plane

    ;; packages
    p1 p2 - package

    ;; locations (airportA used both as airport and location)
    depot locB airportA airportB - location

    ;; time steps (discrete phases)
    t0 t1 t2 t3 - time
  )

  (:init
    ;; time succession (enforce contiguity)
    (next t0 t1)
    (next t1 t2)
    (next t2 t3)

    ;; static connectivity (no invented links beyond these)
    ;; Trucks can drive between depot and locB directly
    (connected-road depot locB)
    (connected-road locB depot)
    ;; Allow truck to reach airportA from depot if needed (explicit roads only)
    (connected-road depot airportA)
    (connected-road airportA depot)

    ;; Planes can fly between airportB and airportA
    (connected-air airportB airportA)
    (connected-air airportA airportB)

    ;; initial agent locations at t0
    (at-vehicle truck1 depot t0)
    (at-vehicle truck2 locB t0)   ;; additional truck present but not required for current deliveries
    (at-vehicle plane1 airportB t0)

    ;; initial packages at t0
    (at-package p1 depot t0)      ;; p1 to be delivered from depot -> locB
    (at-package p2 airportB t0)   ;; p2 to be delivered airportB -> airportA (airportA == locA)

    ;; initial free capacities (all vehicles empty at t0)
    (free truck1 t0)
    (free truck2 t0)
    (free plane1 t0)
  )

  (:goal
    (and
      ;; Mandated terminal conditions by end of final phase t3:
      ;; both packages delivered to their required destinations at t3
      (at-package p1 locB t3)
      (at-package p2 airportA t3)

      ;; enforce that no package remains inside any vehicle at final time (vehicles must be unloaded)
      (not (exists (?pp - package ?v - vehicle) (in ?pp ?v t3)))

      ;; enforce that vehicles' capacities are free at final time (empty)
      (free truck1 t3)
      (free truck2 t3)
      (free plane1 t3)
    )
  )
)