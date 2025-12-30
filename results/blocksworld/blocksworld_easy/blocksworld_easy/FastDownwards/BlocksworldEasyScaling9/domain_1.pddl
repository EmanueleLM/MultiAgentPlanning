(define (domain hanoi-4-disks)
    (:requirements :strips :typing)

    (:types
        disk 
        peg
    )

    (:predicates
        ; d1 is immediately on support s2 (disk or peg)
        (on ?d1 - disk ?s2 - (either disk peg)) 
        
        ; d1 is smaller than d2 (static constraint)
        (smaller ?d1 - disk ?d2 - disk)        
        
        ; s has nothing on it (top disk or empty peg)
        (clear ?s - (either disk peg))         
    )

    ;; Action 1: Move disk D from Support S_from to Disk D_to
    ;; Requires D to be smaller than D_to
    (:action move-disk-to-disk
        :parameters (?d - disk ?s_from - (either disk peg) ?d_to - disk)
        :precondition (and
            (on ?d ?s_from)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?s_from))
            (on ?d ?d_to)
            (not (clear ?d_to))
            (clear ?s_from)
        )
    )

    ;; Action 2: Move disk D from Support S_from to Peg P_to
    ;; Applicable if P_to is empty (clear)
    (:action move-disk-to-peg
        :parameters (?d - disk ?s_from - (either disk peg) ?p_to - peg)
        :precondition (and
            (on ?d ?s_from)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?s_from))
            (on ?d ?p_to)
            (not (clear ?p_to))
            (clear ?s_from)
        )
    )
)