(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions)

    (:types
        support
        disk - support
        peg - support
    )

    (:predicates
        ; d1 is immediately on support s2 (disk or peg)
        (on ?d1 - disk ?s2 - support) 
        
        ; d1 is smaller than d2 (static constraint)
        (smaller ?d1 - disk ?d2 - disk)        
        
        ; s has nothing on it (top disk or empty peg)
        (clear ?s - support)         
    )

    ;; Action 1: Move disk D from support S_from to a Peg P_to
    ;; Only allowed if D is clear and P_to is clear/empty
    (:action move-to-peg
        :parameters (?d - disk ?s_from - support ?p_to - peg)
        :precondition (and
            (on ?d ?s_from)
            (clear ?d)
            (clear ?p_to)
            (not (= ?s_from ?p_to))
        )
        :effect (and
            (not (on ?d ?s_from))
            (on ?d ?p_to)
            (not (clear ?p_to)) ; Peg P_to is no longer clear
            (clear ?s_from)     ; S_from becomes clear
        )
    )

    ;; Action 2: Move disk D from support S_from onto another Disk D_to
    ;; Only allowed if D is smaller than D_to, and D_to is clear
    (:action move-to-disk
        :parameters (?d - disk ?s_from - support ?d_to - disk)
        :precondition (and
            (on ?d ?s_from)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to) ; Hanoi constraint: smaller on larger
            (not (= ?d ?d_to))
        )
        :effect (and
            (not (on ?d ?s_from))
            (on ?d ?d_to)
            (not (clear ?d_to)) ; D_to is no longer clear
            (clear ?s_from)     ; S_from becomes clear
        )
    )