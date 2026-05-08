(define (problem combined-logistics-depot-scenario)
    (:domain logistics-depot)

    (:objects
        depot0 distributor0 depot1 - location ; Combined locations from both inputs
        truck0 truck1 - truck              ; Combined trucks, now both typed as 'truck' (subtype of carrier)
        crate2 crateA crateB - crate       ; All crates from both inputs
        hoist1 - hoist                     ; Hoist from Input 2
    )

    (:init
        ; Initial state from Input 1 (Logistics Planner), converted to harmonized predicates/types:
        (at-carrier truck0 depot0)       ; truck0 at depot0
        (at-crate crate2 depot0)         ; crate2 is generally at depot0 (as it's loaded in truck0)
        (loaded crate2 truck0)           ; crate2 is loaded into truck0 (replaces 'in')

        ; Initial state from Input 2 (Depot Manager), converted where necessary:
        (at-hoist hoist1 depot1)
        (hoist-empty hoist1)
        (at-crate crateA depot1)         ; crateA is on the floor at depot1
        (at-carrier truck1 depot1)       ; truck1 at depot1
        (loaded crateB truck1)           ; crateB is loaded into truck1
    )
    (:goal (and
        ; Mapping "crate1 on pallet1" to available objects: crateA at distributor0
        (at-crate crateA distributor0)
        ; Mapping "crate2 on pallet3" to available objects: crate2 at depot0
        (at-crate crate2 depot0)
    ))
)