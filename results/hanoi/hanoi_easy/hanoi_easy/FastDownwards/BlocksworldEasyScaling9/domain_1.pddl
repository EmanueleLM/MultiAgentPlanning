(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:constants 
        A B C D - disk ; A smallest, D largest
        L M R - peg    ; Left, Middle, Right pegs
    )
    (:predicates
        (on ?d - disk ?s - object) ; d is supported by s (disk or peg)
        (clear-top ?s - object)    ; s is clear (available to receive a disk)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )
    
    (:functions
        (total-cost) - number
    )

    ;; 1. Move onto a Peg
    (:action move-to-peg
        :parameters (?d - disk ?s_from - object ?p_to - peg)
        :precondition (and
            (on ?d ?s_from)    ; D is currently on S_from
            (clear-top ?d)     ; D must be the top disk
            (clear-top ?p_to)  ; Destination peg must be clear
        )
        :effect (and
            (not (on ?d ?s_from))
            (on ?d ?p_to)
            (clear-top ?s_from) ; Source support becomes clear
            (not (clear-top ?p_to))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move onto a Disk
    (:action move-to-disk
        :parameters (?d - disk ?s_from - object ?d_to - disk)
        :precondition (and
            (on ?d ?s_from) 
            (clear-top ?d)      
            (clear-top ?d_to)   
            (smaller ?d ?d_to) ; Must place smaller disk on a strictly larger disk
        )
        :effect (and
            (not (on ?d ?s_from))
            (on ?d ?d_to)
            (clear-top ?s_from)
            (not (clear-top ?d_to))
            (increase (total-cost) 1)
        )
    )
)