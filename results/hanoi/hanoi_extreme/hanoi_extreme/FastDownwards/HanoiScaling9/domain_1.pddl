(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg 
    )
    
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 rests immediately on d2
        (at ?d - disk ?p - peg)   ; d is the base disk resting on peg p
        (clear ?x - disk)         ; x has nothing on top
        (top-of ?p - peg ?d - disk) ; d is the disk currently at the top of peg p
        (empty ?p - peg)          ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (fixed property)
    )

    ; ACTION 1: Move disk D (which is sitting on another disk U) from P_from to an empty P_to
    (:action move-top-to-empty-peg
        :parameters (?d - disk ?p-from - peg ?p-to - peg ?under - disk)
        :precondition (and
            (clear ?d)
            (empty ?p-to)
            (top-of ?p-from ?d)
            (on ?d ?under)
        )
        :effect (and
            ; Update D's location
            (not (on ?d ?under))
            (at ?d ?p-to)
            
            ; Update P_from status
            (clear ?under)
            (top-of ?p-from ?under)
            (not (top-of ?p-from ?d))

            ; Update P_to status
            (not (empty ?p-to))
            (top-of ?p-to ?d)
        )
    )

    ; ACTION 2: Move disk D (which is the sole disk on P_from) to an empty P_to
    (:action move-sole-disk-to-empty-peg
        :parameters (?d - disk ?p-from - peg ?p-to - peg)
        :precondition (and
            (clear ?d)
            (empty ?p-to)
            (top-of ?p-from ?d)
            (at ?d ?p-from)
        )
        :effect (and
            ; Update D's location
            (not (at ?d ?p-from))
            (at ?d ?p-to)
            
            ; Update P_from status
            (empty ?p-from)
            (not (top-of ?p-from ?d))

            ; Update P_to status
            (not (empty ?p-to))
            (top-of ?p-to ?d)
        )
    )
    
    ; ACTION 3: Move disk D (which is sitting on another disk U) onto disk D_target on P_to
    (:action move-top-onto-disk
        :parameters (?d - disk ?p-from - peg ?p-to - peg ?under - disk ?d-target - disk)
        :precondition (and
            (clear ?d)
            (top-of ?p-from ?d)
            (top-of ?p-to ?d-target)
            (clear ?d-target)
            (smaller ?d ?d-target) ; Hanoi Rule: D must be smaller than D_target
            (on ?d ?under)
        )
        :effect (and
            ; Update D's location
            (not (on ?d ?under))
            (on ?d ?d-target)
            
            ; Update P_from status
            (clear ?under)
            (top-of ?p-from ?under)
            (not (top-of ?p-from ?d))
            
            ; Update P_to status
            (not (clear ?d-target))
            (not (top-of ?p-to ?d-target))
            (top-of ?p-to ?d)
        )
    )

    ; ACTION 4: Move disk D (which is the sole disk on P_from) onto disk D_target on P_to
    (:action move-sole-disk-onto-disk
        :parameters (?d - disk ?p-from - peg ?p-to - peg ?d-target - disk)
        :precondition (and
            (clear ?d)
            (top-of ?p-from ?d)
            (at ?d ?p-from)
            (top-of ?p-to ?d-target)
            (clear ?d-target)
            (smaller ?d ?d-target) ; Hanoi Rule: D must be smaller than D_target
        )
        :effect (and
            ; Update D's location
            (not (at ?d ?p-from))
            (on ?d ?d-target)
            
            ; Update P_from status
            (empty ?p-from)
            (not (top-of ?p-from ?d))
            
            ; Update P_to status
            (not (clear ?d-target))
            (not (top-of ?p-to ?d-target))
            (top-of ?p-to ?d)
        )
    )
)