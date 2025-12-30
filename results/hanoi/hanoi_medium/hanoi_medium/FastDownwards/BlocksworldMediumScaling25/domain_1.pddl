(define (domain hanoi-5disk)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types disk peg)
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is resting directly on d2
        (at-peg ?d - disk ?p - peg) ; d is the disk resting directly on peg p
        (top ?d - disk) ; d is the top disk (clear)
        (peg-clear ?p - peg) ; peg p is empty
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Move D from Disk D_src to Disk D_dest (Stacking on a disk)
    (define (action stack-disk-on-disk)
        :parameters (?d - disk ?d_src - disk ?d_dest - disk)
        :precondition (and
            (top ?d) 
            (on ?d ?d_src)
            (top ?d_dest)
            (smaller ?d ?d_dest) 
        )
        :effect (and
            (not (on ?d ?d_src))
            (on ?d ?d_dest)
            (not (top ?d_dest)) 
            (top ?d_src)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D from Disk D_src to Peg P_dest (Moving an upper disk to an empty peg)
    (define (action stack-disk-on-peg)
        :parameters (?d - disk ?d_src - disk ?p_dest - peg)
        :precondition (and
            (top ?d) 
            (on ?d ?d_src)
            (peg-clear ?p_dest)
        )
        :effect (and
            (not (on ?d ?d_src))
            (at-peg ?d ?p_dest)
            (top ?d_src)
            (not (peg-clear ?p_dest))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move D from Peg P_src to Disk D_dest (Moving base disk upwards)
    (define (action lift-base-disk-to-disk)
        :parameters (?d - disk ?d_dest - disk ?p_src - peg)
        :precondition (and
            (top ?d) 
            (at-peg ?d ?p_src)
            (top ?d_dest)
            (smaller ?d ?d_dest)
        )
        :effect (and
            (not (at-peg ?d ?p_src))
            (on ?d ?d_dest)
            (not (top ?d_dest))
            (peg-clear ?p_src)
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. Move D from Peg P_src to Peg P_dest (Moving base disk between empty pegs)
    (define (action lift-base-disk-to-peg)
        :parameters (?d - disk ?p_src - peg ?p_dest - peg)
        :precondition (and
            (top ?d) 
            (at-peg ?d ?p_src)
            (peg-clear ?p_dest)
        )
        :effect (and
            (not (at-peg ?d ?p_src))
            (at-peg ?d ?p_dest)
            (peg-clear ?p_src)
            (not (peg-clear ?p_dest))
            (increase (total-cost) 1)
        )
    )
)