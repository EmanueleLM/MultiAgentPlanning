(define (domain hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        disk 
        peg
    )
    (:predicates
        (on_disk ?d1 - disk ?d2 - disk) ; d1 is directly stacked on d2
        (on_peg ?d - disk ?p - peg)     ; d is the bottom disk resting on peg p
        (clear ?d - disk)               ; d has nothing on top
        (empty ?p - peg)                ; p has no disks
        (belongs-to ?d - disk ?p - peg) ; d is currently part of the stack on peg p
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static constraint)
    )
    (:functions
        (total-cost) - number
    )

    ; 1. Move D from Disk B1 (on P1) to Disk B2 (on P2)
    (:action move-disk-to-disk
        :parameters (?d - disk ?b1 - disk ?b2 - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (clear ?d)
            (on_disk ?d ?b1)
            (belongs-to ?d ?p1) 
            (clear ?b2)
            (belongs-to ?b2 ?p2) 
            (smaller ?d ?b2) ; Hanoi constraint: D must be smaller than B2
            (not (= ?p1 ?p2)) ; Must move between pegs
        )
        :effect (and
            (not (on_disk ?d ?b1))
            (on_disk ?d ?b2)
            (clear ?b1)
            (not (clear ?b2))
            (not (belongs-to ?d ?p1))
            (belongs-to ?d ?p2)
            (increase (total-cost) 1)
        )
    )
    
    ; 2. Move D from Disk B1 (on P1) to Empty Peg P2
    (:action move-disk-to-empty-peg
        :parameters (?d - disk ?b1 - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (clear ?d)
            (on_disk ?d ?b1)
            (belongs-to ?d ?p1)
            (empty ?p2)
            (not (= ?p1 ?p2))
        )
        :effect (and
            (not (on_disk ?d ?b1))
            (on_peg ?d ?p2) 
            (clear ?b1)
            (not (empty ?p2))
            (not (belongs-to ?d ?p1))
            (belongs-to ?d ?p2)
            (increase (total-cost) 1)
        )
    )
    
    ; 3. Move D from Peg P1 (D is bottom disk) to Disk B2 (on P2)
    (:action move-bottom-disk-to-disk
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?b2 - disk)
        :precondition (and
            (clear ?d)
            (on_peg ?d ?p1)
            (belongs-to ?d ?p1) 
            (clear ?b2)
            (belongs-to ?b2 ?p2)
            (smaller ?d ?b2) ; Hanoi constraint: D must be smaller than B2
            (not (= ?p1 ?p2))
        )
        :effect (and
            (not (on_peg ?d ?p1))
            (on_disk ?d ?b2)
            (empty ?p1) ; P1 becomes empty
            (not (clear ?b2))
            (not (belongs-to ?d ?p1))
            (belongs-to ?d ?p2)
            (increase (total-cost) 1)
        )
    )
    
    ; 4. Move D from Peg P1 (D is bottom disk) to Empty Peg P2
    (:action move-bottom-disk-to-empty-peg
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (clear ?d)
            (on_peg ?d ?p1)
            (belongs-to ?d ?p1)
            (empty ?p2)
            (not (= ?p1 ?p2))
        )
        :effect (and
            (not (on_peg ?d ?p1))
            (on_peg ?d ?p2)
            (empty ?p1) 
            (not (empty ?p2))
            (not (belongs-to ?d ?p1))
            (belongs-to ?d ?p2)
            (increase (total-cost) 1)
        )
    )
)