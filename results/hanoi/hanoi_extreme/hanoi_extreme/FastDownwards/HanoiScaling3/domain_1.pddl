(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk - object
        peg - object
    )
    (:predicates
        (on ?d1 - disk ?o2 - object) ; d1 is immediately on o2 (disk or peg)
        (clear ?o - object) ; o is the topmost object in a stack/or an empty peg
        (smaller ?d1 - disk ?d2 - disk) ; d1 < d2 (static)
    )

    (:action move
        :parameters (?d - disk ?base_from - object ?base_to - object)
        :precondition (and
            ; 1. Disk D must be the top disk
            (clear ?d)
            
            ; 2. D must be resting on base_from
            (on ?d ?base_from)
            
            ; 3. Target base must be clear
            (clear ?base_to)
            
            ; 4. Must move between distinct bases
            (not (= ?base_from ?base_to))
            
            ; 5. Size constraint: D must be smaller than base_to, IF base_to is a disk.
            ; This relies on PDDL interpreters recognizing that (smaller ?d ?base_to) is only possible if ?base_to is a disk.
            (or 
                (peg ?base_to) 
                (smaller ?d ?base_to)
            )
        )
        :effect (and
            ; 1. Update source
            (not (on ?d ?base_from))
            (clear ?base_from) 

            ; 2. Update target
            (not (clear ?base_to))
            (on ?d ?base_to)
        )
    )
)