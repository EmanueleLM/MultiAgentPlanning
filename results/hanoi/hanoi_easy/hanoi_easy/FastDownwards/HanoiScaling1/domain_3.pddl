(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        ; Stacking relation: d1 is immediately on top of d2
        (on ?d1 - disk ?d2 - disk)
        ; Base relation: d is the bottom disk, resting on peg p
        (on-peg ?d - disk ?p - peg)
        ; Movability: d has nothing on top of it
        (clear-d ?d - disk)
        ; Peg status: p has no disks
        (clear-p ?p - peg)
        ; Size constraint: d1 is smaller than d2
        (smaller ?d1 - disk ?d2 - disk)
        ; Location tracker: d is currently located on p
        (location ?d - disk ?p - peg)
    )

    (:functions
        (total-cost) - number
    )

    ; Action 1: Disk on Disk to Disk on Disk (A/B -> C/D)
    (:action move-d-d--d-d
        :parameters (?d - disk ?d_from - disk ?d_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-d ?d) ; Must be the top disk
            (on ?d ?d_from) ; Source stacking
            (location ?d ?p_from)
            
            (clear-d ?d_to) ; Target disk must be clear
            (location ?d_to ?p_to)
            
            (smaller ?d ?d_to) ; Size constraint: must place smaller on larger
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?d_from))
            (not (clear-d ?d_to))
            
            (clear-d ?d_from) ; Disk below source becomes clear
            (on ?d ?d_to) ; New stacking
            
            (not (location ?d ?p_from))
            (location ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Disk on Disk to Disk on Peg (A/B -> P)
    (:action move-d-d--d-p
        :parameters (?d - disk ?d_from - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-d ?d)
            (on ?d ?d_from)
            (location ?d ?p_from)
            
            (clear-p ?p_to) ; Target peg must be empty
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?d_from))
            (clear-d ?d_from) ; Disk below source becomes clear
            
            (not (clear-p ?p_to)) ; Target peg is now occupied
            (on-peg ?d ?p_to) ; Disk becomes the base
            
            (not (location ?d ?p_from))
            (location ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )

    ; Action 3: Disk on Peg to Disk on Disk (P -> C/D)
    (:action move-d-p--d-d
        :parameters (?d - disk ?d_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-d ?d)
            (on-peg ?d ?p_from) ; Must be the base disk
            (location ?d ?p_from)
            
            (clear-d ?d_to) ; Target disk must be clear
            (location ?d_to ?p_to)
            
            (smaller ?d ?d_to) ; Size constraint
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (clear-p ?p_from) ; Source peg becomes empty
            
            (not (clear-d ?d_to))
            (on ?d ?d_to) ; New stacking
            
            (not (location ?d ?p_from))
            (location ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )

    ; Action 4: Disk on Peg to Disk on Peg (P -> P)
    (:action move-d-p--d-p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-d ?d)
            (on-peg ?d ?p_from)
            (location ?d ?p_from)
            
            (clear-p ?p_to) ; Target peg must be empty
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (clear-p ?p_from) ; Source peg becomes empty
            
            (not (clear-p ?p_to)) ; Target peg is now occupied
            (on-peg ?d ?p_to) ; Disk becomes the new base
            
            (not (location ?d ?p_from))
            (location ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )
)