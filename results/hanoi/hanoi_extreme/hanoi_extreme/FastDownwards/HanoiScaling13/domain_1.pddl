(define (domain hanoi-7-disks-strips)
    (:requirements :strips :typing :negative-preconditions :equality)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)     ; d1 is immediately on top of d2
        (on-peg ?d - disk ?p - peg)    ; d is the disk resting directly on the peg
        (clear-disk ?d - disk)         ; Nothing is on top of disk d
        (clear-peg ?p - peg)           ; Nothing is on top of peg p

        ; Static size constraints: d1 is smaller than d2
        (smaller ?d1 - disk ?d2 - disk)
    )

    ; Action 1: Moving Disk from Disk support onto Disk support
    (:action move-disk-disk
        :parameters (?d - disk  ; disk being moved
                     ?b - disk  ; old bottom support (disk)
                     ?t - disk  ; new top support (disk)
                     ?from - peg ; Source peg context
                     ?to - peg   ; Destination peg context
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (clear-disk ?t)
            (on ?d ?b)
            (smaller ?d ?t) ; Size constraint: D must be smaller than T
        )
        :effect (and
            ; 1. Source changes
            (not (on ?d ?b))
            (clear-disk ?b)

            ; 2. Destination changes
            (on ?d ?t)
            (not (clear-disk ?t))
        )
    )
    
    ; Action 2: Moving Disk from Disk support onto Peg support (empty peg)
    (:action move-disk-peg
        :parameters (?d - disk
                     ?b - disk     ; old bottom support (disk)
                     ?p_to - peg   ; new top support (peg)
                     ?from - peg 
        )
        :precondition (and
            (not (= ?from ?p_to))
            (clear-disk ?d)
            (clear-peg ?p_to) ; Peg must be empty
            (on ?d ?b)
        )
        :effect (and
            ; 1. Source changes
            (not (on ?d ?b))
            (clear-disk ?b)

            ; 2. Destination changes
            (on-peg ?d ?p_to)
            (not (clear-peg ?p_to))
        )
    )
    
    ; Action 3: Moving Disk from Peg support onto Disk support
    (:action move-peg-disk
        :parameters (?d - disk
                     ?p_from - peg ; old bottom support (peg)
                     ?t - disk     ; new top support (disk)
                     ?to - peg 
        )
        :precondition (and
            (not (= ?p_from ?to))
            (clear-disk ?d)
            (clear-disk ?t)
            (on-peg ?d ?p_from)
            (smaller ?d ?t) ; Size constraint: D must be smaller than T
        )
        :effect (and
            ; 1. Source changes
            (not (on-peg ?d ?p_from))
            (clear-peg ?p_from)

            ; 2. Destination changes
            (on ?d ?t)
            (not (clear-disk ?t))
        )
    )
    
    ; Action 4: Moving Disk from Peg support onto Peg support (empty peg to empty peg)
    (:action move-peg-peg
        :parameters (?d - disk
                     ?p_from - peg
                     ?p_to - peg
        )
        :precondition (and
            (not (= ?p_from ?p_to))
            (clear-disk ?d)
            (on-peg ?d ?p_from)
            (clear-peg ?p_to)
        )
        :effect (and
            ; 1. Source changes
            (not (on-peg ?d ?p_from))
            (clear-peg ?p_from)
            
            ; 2. Destination changes
            (on-peg ?d ?p_to)
            (not (clear-peg ?p_to))
        )
    )
)