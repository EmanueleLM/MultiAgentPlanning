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

        ; Dynamic location tracking: Disk ?d is part of the stack on peg ?p
        (is-on ?d - disk ?p - peg)
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
            (is-on ?b ?from) ; B must be located on the source peg stack
            (is-on ?t ?to)   ; T must be located on the destination peg stack
            (smaller ?d ?t)  ; Size constraint: D must be smaller than T
        )
        :effect (and
            ; Source changes
            (not (on ?d ?b))
            (clear-disk ?b)
            (not (is-on ?d ?from))

            ; Destination changes
            (on ?d ?t)
            (not (clear-disk ?t))
            (is-on ?d ?to)
        )
    )
    
    ; Action 2: Moving Disk from Disk support onto Peg support (empty peg)
    (:action move-disk-peg
        :parameters (?d - disk
                     ?b - disk     ; old bottom support (disk)
                     ?from - peg   ; Source peg
                     ?to - peg     ; Destination peg
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (on ?d ?b)
            (is-on ?b ?from) ; B must be located on the source peg stack
            (clear-peg ?to)  ; Peg must be empty
        )
        :effect (and
            ; Source changes
            (not (on ?d ?b))
            (clear-disk ?b)
            (not (is-on ?d ?from))

            ; Destination changes
            (on-peg ?d ?to)
            (not (clear-peg ?to))
            (is-on ?d ?to)
        )
    )
    
    ; Action 3: Moving Disk from Peg support onto Disk support
    (:action move-peg-disk
        :parameters (?d - disk
                     ?from - peg ; old bottom support (peg)
                     ?t - disk     ; new top support (disk)
                     ?to - peg     ; Destination peg 
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (on-peg ?d ?from)
            (is-on ?t ?to)   ; T must be located on the destination peg stack
            (clear-disk ?t)
            (smaller ?d ?t) ; Size constraint: D must be smaller than T
        )
        :effect (and
            ; Source changes
            (not (on-peg ?d ?from))
            (clear-peg ?from)
            (not (is-on ?d ?from)) ; D moves location

            ; Destination changes
            (on ?d ?t)
            (not (clear-disk ?t))
            (is-on ?d ?to)
        )
    )
    
    ; Action 4: Moving Disk from Peg support onto Peg support (empty peg to empty peg)
    (:action move-peg-peg
        :parameters (?d - disk
                     ?from - peg
                     ?to - peg
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (on-peg ?d ?from)
            (is-on ?d ?from) ; D must be located on source peg stack
            (clear-peg ?to)
        )
        :effect (and
            ; Source changes
            (not (on-peg ?d ?from))
            (clear-peg ?from)
            (not (is-on ?d ?from))
            
            ; Destination changes
            (on-peg ?d ?to)
            (not (clear-peg ?to))
            (is-on ?d ?to)
        )
    )
)