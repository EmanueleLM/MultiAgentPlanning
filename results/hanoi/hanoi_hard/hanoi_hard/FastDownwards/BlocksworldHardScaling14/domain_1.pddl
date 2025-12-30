(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)   ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg)  ; d is the bottom disk on peg p
        (clear ?x - (either disk peg)) ; x is available to receive a disk
        (smaller ?d1 - disk ?d2 - disk) ; d1 is strictly smaller than d2
    )
    
    ; 1. Move D from a Disk S to a Disk T (Target T must be larger than D)
    (:action move-disk-to-disk
        :parameters (?d - disk ?s - disk ?t - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?s)
            (clear ?t)
            (smaller ?d ?t) 
        )
        :effect (and
            (not (on ?d ?s))
            (not (clear ?t))
            (on ?d ?t)
            (clear ?s)
        )
    )
    
    ; 2. Move D from a Disk S to a Peg P (Peg P must be clear)
    (:action move-disk-to-peg
        :parameters (?d - disk ?s - disk ?p - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?s)
            (clear ?p) 
        )
        :effect (and
            (not (on ?d ?s))
            (not (clear ?p))
            (on-peg ?d ?p)
            (clear ?s)
        )
    )
    
    ; 3. Move D from a Peg S to a Disk T (Target T must be larger than D)
    (:action move-peg-to-disk
        :parameters (?d - disk ?s - peg ?t - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?s) 
            (clear ?t)
            (smaller ?d ?t) 
        )
        :effect (and
            (not (on-peg ?d ?s))
            (not (clear ?t))
            (on ?d ?t)
            (clear ?s)
        )
    )
    
    ; 4. Move D from a Peg S to a Peg T (Target T must be clear)
    (:action move-peg-to-peg
        :parameters (?d - disk ?s - peg ?t - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?s)
            (clear ?t)
            (not (= ?s ?t)) 
        )
        :effect (and
            (not (on-peg ?d ?s))
            (not (clear ?t))
            (on-peg ?d ?t)
            (clear ?s)
        )
    )
)