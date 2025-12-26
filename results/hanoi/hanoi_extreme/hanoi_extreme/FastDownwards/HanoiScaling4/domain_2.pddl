(define (domain hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk object
        peg object
    )
    (:predicates
        ;; (on ?d - disk ?b - object): ?d is immediately on ?b. ?b can be a disk or a peg.
        (on ?d - disk ?b - object)
        ;; (clear ?b - object): ?b has nothing on top of it.
        (clear ?b - object)
        ;; (smaller ?d1 - disk ?d2 - disk): Static size relation.
        (smaller ?d1 - disk ?d2 - disk)
    )

    ;; Action 1: Moving disk D from base B1 to a clear PEG P_to
    (:action move-disk-to-peg
        :parameters (?d - disk ?b1 - object ?p_to - peg)
        :precondition (and
            (on ?d ?b1)     ; D must be resting on B1
            (clear ?d)      ; D must be the top disk
            (clear ?p_to)   ; Destination peg must be clear (empty)
        )
        :effect (and
            (not (on ?d ?b1))
            (on ?d ?p_to)
            (not (clear ?p_to)) ; Peg P_to is now occupied by D
            (clear ?b1)         ; B1 is now clear
        )
    )

    ;; Action 2: Moving disk D from base B1 to a clear DISK D_to
    (:action move-disk-to-disk
        :parameters (?d - disk ?b1 - object ?d_to - disk)
        :precondition (and
            (on ?d ?b1)     ; D must be resting on B1
            (clear ?d)      ; D must be the top disk
            (clear ?d_to)   ; Destination disk D_to must be clear
            (smaller ?d ?d_to) ; Strict size constraint: D must be smaller than D_to
        )
        :effect (and
            (not (on ?d ?b1))
            (on ?d ?d_to)
            (not (clear ?d_to)) ; D_to is now covered by D
            (clear ?b1)         ; B1 is now clear
        )
    )
)