```pddl
(define (domain tower-of-hanoi-5)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (at ?d - disk ?p - peg)    ; d is located at peg p
        (base ?d - disk ?p - peg)  ; d is the bottom disk resting on peg p
        (top ?d - disk)            ; d is the topmost disk (clear)
        (empty ?p - peg)           ; p is empty
        (smaller ?d1 - disk ?d2 - disk) ; Static size constraint: d1 < d2
    )
    
    ; 1. Move D from B_from (Disk) to B_to (Disk)
    (:action move-disk-to-disk
        :parameters (?d - disk ?b_from - disk ?b_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (at ?d ?p_from)
            (at ?b_to ?p_to)
            (on ?d ?b_from)
            (top ?d)
            (top ?b_to)
            (smaller ?d ?b_to) ; D must be smaller than B_to
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on ?d ?b_to)
            (at ?d ?p_to)
            (top ?b_from)
            (not (on ?d ?b_from))
            (not (at ?d ?p_from))
            (not (top ?b_to))
        )
    )
    
    ; 2. Move D from B_from (Disk) to P_to (Empty Peg)
    (:action move-disk-to-peg
        :parameters (?d - disk ?b_from - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (at ?d ?p_from)
            (on ?d ?b_from)
            (top ?d)
            (empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (base ?d ?p_to)
            (at ?d ?p_to)
            (top ?b_from)
            (not (on ?d ?b_from))
            (not (at ?d ?p_from))
            (not (empty ?p_to))
        )
    )

    ; 3. Move D from P_from (Base Disk) to B_to (Disk)
    (:action move-base-disk-to-disk
        :parameters (?d - disk ?b_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (at ?d ?p_from)
            (base ?d ?p_from)
            (top ?d)
            
            (at ?b_to ?p_to)
            (top ?b_to)
            (smaller ?d ?b_to) ; D must be smaller than B_to
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on ?d ?b_to)
            (at ?d ?p_to)
            (empty ?p_from) ; P_from becomes empty
            
            (not (base ?d ?p_from))
            (not (at ?d ?p_from))
            (not (top ?b_to))
        )
    )
    
    ; 4. Move D from P_from (Base Disk) to P_to (Empty Peg)
    (:action move-base-disk-to-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (at ?d ?p_from)
            (base ?d ?p_from)
            (top ?d)
            (empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (base ?d ?p_to)
            (at ?d ?p_to)
            (empty ?p_from)
            
            (not (base ?d ?p_from))
            (not (at ?d ?p_from))
            (not (empty ?p_to))
        )
    )
)
```