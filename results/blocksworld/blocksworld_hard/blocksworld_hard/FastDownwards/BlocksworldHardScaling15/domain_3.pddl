(define (domain hanoi-6disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk 
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)       ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg)      ; d is directly on peg p (the bottom disk)
        (clear ?d - disk)                ; d is the topmost disk (available to move)
        (peg-empty ?p - peg)             ; p has no disks
        (smaller ?d1 - disk ?d2 - disk)  ; Static size relationship: d1 < d2
    )

    ;; 1. Move D1 from Disk D_Source onto Disk D_Target
    (:action move-d-to-d
        :parameters (?d1 - disk ?d_source - disk ?d_target - disk)
        :precondition (and
            (on ?d1 ?d_source)
            (clear ?d1)
            (clear ?d_target)
            (smaller ?d1 ?d_target)
        )
        :effect (and
            (not (on ?d1 ?d_source)) 
            (on ?d1 ?d_target)
            (clear ?d_source)
            (not (clear ?d_target))
        )
    )

    ;; 2. Move D1 from Disk D_Source onto Empty Peg P_Target
    (:action move-d-to-p_empty
        :parameters (?d1 - disk ?d_source - disk ?p_target - peg)
        :precondition (and
            (on ?d1 ?d_source)
            (clear ?d1)
            (peg-empty ?p_target)
        )
        :effect (and
            (not (on ?d1 ?d_source))
            (on-peg ?d1 ?p_target)
            (clear ?d_source)
            (not (peg-empty ?p_target))
        )
    )

    ;; 3. Move D1 from Peg P_Source onto Disk D_Target
    (:action move-p-to-d
        :parameters (?d1 - disk ?p_source - peg ?d_target - disk)
        :precondition (and
            (on-peg ?d1 ?p_source)
            (clear ?d1)
            (clear ?d_target)
            (smaller ?d1 ?d_target)
            (not (peg-empty ?p_source)) 
        )
        :effect (and
            (not (on-peg ?d1 ?p_source))
            (on ?d1 ?d_target)
            (peg-empty ?p_source)
            (not (clear ?d_target))
        )
    )

    ;; 4. Move D1 from Peg P_Source onto Empty Peg P_Target
    (:action move-p-to-p_empty
        :parameters (?d1 - disk ?p_source - peg ?p_target - peg)
        :precondition (and
            (on-peg ?d1 ?p_source)
            (clear ?d1)
            (peg-empty ?p_target)
            (not (peg-empty ?p_source)) 
        )
        :effect (and
            (not (on-peg ?d1 ?p_source))
            (on-peg ?d1 ?p_target)
            (peg-empty ?p_source)
            (not (peg-empty ?p_target))
        )
    )
)