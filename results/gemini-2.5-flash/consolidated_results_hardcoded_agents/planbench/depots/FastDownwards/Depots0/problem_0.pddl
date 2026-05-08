(define (problem unified-transport-handling)
    (:domain unified-logistics-handling)

    (:objects
        ; Places
        depot0 - place
        distributor0 - place
        city_center - place 
        storage1 - place 

        ; Vehicles and Hoist
        t1 - truck
        h1 - hoist
        
        ; Cargo (Crates and Packages)
        c2 - cargo 
        pa - cargo 
        pb - cargo 
    )

    (:init
        ; --- Static Definitions ---
        ; Roads 
        (road depot0 distributor0)
        (road distributor0 depot0)
        (road depot0 city_center)
        (road city_center distributor0)

        ; Loading Bay Definitions 
        (is-loading-bay depot0)
        (is-loading-bay distributor0)

        ; --- Initial Dynamic State ---
        
        ; Hoist state
        (hoist-free h1)

        ; Vehicle location
        (at t1 depot0)

        ; Cargo locations 
        ; C2 starts at the logistics hub (depot0)
        (at c2 depot0) 
        ; PA starts at general storage (storage1)
        (at pa storage1)
        ; PB starts at the bay/logistics hub (depot0)
        (at pb depot0)

        ; No cargo is initially IN the truck.
    )

    (:goal
        (and
            ; Crate C2 must be unloaded at distributor0 
            (at c2 distributor0)
            
            ; Package PA must reach the loading bay/depot0 
            (at pa depot0)
            
            ; Package PB must reach storage1 
            (at pb storage1)
        )
    )
)