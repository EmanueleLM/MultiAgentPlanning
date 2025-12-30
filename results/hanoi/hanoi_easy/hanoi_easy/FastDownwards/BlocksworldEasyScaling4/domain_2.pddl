(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk - object
        peg - object
    )

    (:predicates
        ; ?loc can be a disk or a peg
        (on ?d - disk ?loc - object) 
        ; ?loc can be a disk (if top of stack) or a peg (if empty)
        (clear ?loc - object) 
        (smaller ?d1 - disk ?d2 - disk) ; Static size relations
    )
    
    (:functions
        (total-cost) - number
    )

    ; 1. Move Disk D from Source Disk DS to Target Peg PT (e.g., A from B to M)
    (:action move-disk-from-disk-to-peg
        :parameters (?d - disk ?ds - disk ?pt - peg)
        :precondition (and
            (on ?d ?ds) ; D is on DS
            (clear ?d)  ; D is the top disk
            (clear ?pt) ; PT is empty
        )
        :effect (and
            (not (on ?d ?ds))
            (on ?d ?pt)
            (clear ?ds) ; DS becomes clear
            (not (clear ?pt)) ; PT is no longer clear
            (increase (total-cost) 1)
        )
    )

    ; 2. Move Disk D from Source Peg PS to Target Peg PT (e.g., D from L to M, if L supported only D)
    (:action move-disk-from-peg-to-peg
        :parameters (?d - disk ?ps - peg ?pt - peg)
        :precondition (and
            (on ?d ?ps) 
            (clear ?d)
            (clear ?pt) 
        )
        :effect (and
            (not (on ?d ?ps))
            (on ?d ?pt)
            (clear ?ps) ; PS becomes clear (empty)
            (not (clear ?pt)) 
            (increase (total-cost) 1)
        )
    )

    ; 3. Move Disk D from Source Disk DS onto Target Disk DT (e.g., A from R onto B, where A < B)
    (:action move-disk-from-disk-to-disk
        :parameters (?d ?dt ?ds - disk)
        :precondition (and
            (on ?d ?ds) ; D is on DS
            (clear ?d)
            (clear ?dt) ; DT is top of its stack
            (smaller ?d ?dt) ; D < DT (Hanoi constraint)
        )
        :effect (and
            (not (on ?d ?ds))
            (on ?d ?dt)
            (clear ?ds) 
            (not (clear ?dt)) ; DT is no longer clear
            (increase (total-cost) 1)
        )
    )

    ; 4. Move Disk D from Source Peg PS onto Target Disk DT (e.g., A from L onto B, where A < B, if L supported only A)
    (:action move-disk-from-peg-to-disk
        :parameters (?d ?dt - disk ?ps - peg)
        :precondition (and
            (on ?d ?ps) 
            (clear ?d)
            (clear ?dt) 
            (smaller ?d ?dt) ; D < DT (Hanoi constraint)
        )
        :effect (and
            (not (on ?d ?ps))
            (on ?d ?dt)
            (clear ?ps) ; PS becomes clear (empty)
            (not (clear ?dt)) 
            (increase (total-cost) 1)
        )
    )