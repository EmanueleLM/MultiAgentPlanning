(define (problem crate_transport)
    (:domain transport)

    (:objects
        depot0 - place
        depot1 - place
        depot2 - place
        distributor0 - place
        pallet0 - surface
        pallet1 - surface
        pallet2 - surface
        pallet3 - surface
        crate0 - surface
        crate1 - surface
        crate2 - surface
        truck0 - vehicle
        truck1 - vehicle
        truck2 - vehicle
        hoist0 - lifting_device
        hoist1 - lifting_device
        hoist2 - lifting_device
        hoist3 - lifting_device
    )

    (:init
        (at crate0 distributor0)
        (at crate1 distributor0)
        (at crate2 distributor0)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 depot1)
        (hoist_available hoist0)
        (hoist_available hoist1)
        (hoist_available hoist2)
        (hoist_available hoist3)
        (clear crate2)
        (clear pallet0)
        (clear pallet1)
        (clear pallet2)
        (on crate0 pallet3)
        (on crate1 crate0)
        (on crate2 crate1)
    )
    
    (:goal (and 
        (on crate1 pallet1)
        (on crate2 pallet2)
    ))
)