(define (domain hanoi_4disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        locatable
        disk - locatable
        peg - locatable
    )
    (:predicates
        (on ?d - disk ?l - locatable)
        (clear ?l - locatable)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    (:action move-to-peg
        :parameters (?d - disk ?from - locatable ?to - peg)
        :precondition (and
            (on ?d ?from)
            (clear ?d)     ; Must be the top disk
            (clear ?to)    ; Peg must be empty
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?to)
            (not (clear ?to)) ; Peg is now covered
            (clear ?from)     ; Previous supporting object/peg is now clear
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d - disk ?from - locatable ?to - disk)
        :precondition (and
            (on ?d ?from)
            (clear ?d)
            (clear ?to)       ; Target disk must be exposed
            (smaller ?d ?to)  ; Hanoi Rule: smaller disk on larger disk
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?to)
            (not (clear ?to)) ; Target disk is now covered
            (clear ?from)
            (increase (total-cost) 1)
        )
    )
)