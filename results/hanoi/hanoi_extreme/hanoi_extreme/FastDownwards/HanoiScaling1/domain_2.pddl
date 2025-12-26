(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        location
        peg disk - location
    )
    
    (:predicates
        (on ?d - disk ?l - location)
        (clear ?l - location) ; True if nothing is stacked on top of ?l
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost)
    )

    ;; Action 1: Move the top disk onto an empty peg.
    (:action move-to-peg
        :parameters (?d - disk ?from - location ?p - peg)
        :precondition (and
            (on ?d ?from)       ; ?d is on ?from
            (clear ?d)          ; ?d is the top disk (can be moved)
            (clear ?p)          ; Destination peg ?p is empty (can receive any disk)
            (not (= ?from ?p))
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?p)
            (clear ?from)       ; The source location becomes clear
            (not (clear ?p))    ; The destination peg is no longer clear
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move the top disk onto a larger, clear disk.
    (:action move-to-disk
        :parameters (?d_top - disk ?from - location ?d_base - disk)
        :precondition (and
            (on ?d_top ?from)      ; ?d_top is on ?from
            (clear ?d_top)         ; ?d_top is the top disk (can be moved)
            (clear ?d_base)        ; Destination disk ?d_base is clear
            (smaller ?d_top ?d_base) ; Crucial Hanoi rule: cannot place larger on smaller
        )
        :effect (and
            (not (on ?d_top ?from))
            (on ?d_top ?d_base)
            (clear ?from)          ; The source location becomes clear
            (not (clear ?d_base))  ; The destination disk is no longer clear
            (increase (total-cost) 1)
        )
    )
)