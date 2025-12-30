(define (domain unified-logistics-handling)
    (:requirements :strips :typing)

    (:types
        place
        truck
        hoist
        cargo
    )

    (:predicates
        ; Location tracking (Vehicles and non-contained cargo)
        (at ?o - (either truck cargo) ?l - place)
        
        ; Vehicle contents
        (in ?c - cargo ?t - truck)
        
        ; Static connections
        (road ?from - place ?to - place)
        
        ; Hoist status
        (hoist-free ?h - hoist)
        (holding ?h - hoist ?c - cargo)
        
        ; Place designation
        (is-loading-bay ?loc - place)
    )

    ;; 1. DRIVE: Move a truck between two connected places
    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (road ?from ?to)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            ; Cargo inside the truck moves implicitly
        )
    )

    ;; 2. LIFT: Pick up cargo from general storage (non-bay)
    (:action lift
        :parameters (?h - hoist ?c - cargo ?loc - place)
        :precondition (and
            (hoist-free ?h)
            (at ?c ?loc)
            (not (is-loading-bay ?loc))
        )
        :effect (and
            (not (hoist-free ?h))
            (holding ?h ?c)
            (not (at ?c ?loc))
        )
    )
    
    ;; 3. LIFT-AT-BAY: Pick up cargo from ground at a loading bay (Necessary addition for moving C2 and PB)
    (:action lift-at-bay
        :parameters (?h - hoist ?c - cargo ?loc - place)
        :precondition (and
            (hoist-free ?h)
            (at ?c ?loc)
            (is-loading-bay ?loc)
        )
        :effect (and
            (not (hoist-free ?h))
            (holding ?h ?c)
            (not (at ?c ?loc))
        )
    )

    ;; 4. DROP: Place cargo onto any place (Constraint removed for solvability)
    (:action drop
        :parameters (?h - hoist ?c - cargo ?loc - place)
        :precondition (holding ?h ?c)
        :effect (and
            (hoist-free ?h)
            (at ?c ?loc)
            (not (holding ?h ?c))
        )
    )

    ;; 5. LOAD: Transfer cargo from hoist into a truck at a designated loading bay
    (:action load
        :parameters (?h - hoist ?c - cargo ?t - truck ?loc - place)
        :precondition (and
            (holding ?h ?c)
            (at ?t ?loc)
            (is-loading-bay ?loc)
        )
        :effect (and
            (hoist-free ?h)
            (in ?c ?t)
            (not (holding ?h ?c))
        )
    )

    ;; 6. UNLOAD: Transfer cargo from a truck to the hoist at a designated loading bay
    (:action unload
        :parameters (?h - hoist ?c - cargo ?t - truck ?loc - place)
        :precondition (and
            (hoist-free ?h)
            (at ?t ?loc)
            (in ?c ?t)
            (is-loading-bay ?loc)
        )
        :effect (and
            (not (hoist-free ?h))
            (holding ?h ?c)
            (not (in ?c ?t))
        )
    )
)