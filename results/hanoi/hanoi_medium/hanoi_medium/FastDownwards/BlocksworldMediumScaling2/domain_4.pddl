(define (domain Hanoi5Disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk 
        peg ; Pegs L, M, R act as base locations
    )
    
    (:predicates
        (on ?x - disk ?y - disk)     ; X is on Y
        (on-base ?x - disk ?p - peg) ; X is the lowest disk on peg P
        (clear ?x - disk)            ; X has nothing on it (movable)
        (clear-base ?p - peg)        ; Peg P base is available (empty)
        
        ; Size ordering: (smaller X Y) means X can be placed on Y
        (smaller ?x - disk ?y - disk) 
    )

    ; ---------------------------------------------------
    ; 1. Move D from Disk D_S onto Disk D_T
    ; Source D is resting on another disk D_S. Target D_T is another disk.
    (:action move-disk-to-disk
        :parameters (?d - disk ?d_s - disk ?d_t - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_s)
            (clear ?d_t)
            (smaller ?d ?d_t) ; Hanoi size rule
        )
        :effect (and
            (on ?d ?d_t)
            (clear ?d_s)
            (not (on ?d ?d_s))
            (not (clear ?d_t))
        )
    )
    
    ; ---------------------------------------------------
    ; 2. Move D from Disk D_S onto Peg Base P_T
    ; Source D is resting on disk D_S. Target P_T is an empty peg base.
    (:action move-disk-to-peg
        :parameters (?d - disk ?d_s - disk ?p_t - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_s)
            (clear-base ?p_t) 
        )
        :effect (and
            (on-base ?d ?p_t)
            (clear ?d_s)
            (not (on ?d ?d_s))
            (not (clear-base ?p_t))
        )
    )

    ; ---------------------------------------------------
    ; 3. Move D from Peg Base P_S onto Disk D_T
    ; Source D is resting on P_S base. Target D_T is another disk.
    (:action move-base-to-disk
        :parameters (?d - disk ?p_s - peg ?d_t - disk)
        :precondition (and
            (clear ?d)
            (on-base ?d ?p_s)
            (clear ?d_t)
            (smaller ?d ?d_t) ; Hanoi size rule
        )
        :effect (and
            (on ?d ?d_t)
            (clear-base ?p_s) ; P_S is now empty
            (not (on-base ?d ?p_s))
            (not (clear ?d_t))
        )
    )

    ; ---------------------------------------------------
    ; 4. Move D from Peg Base P_S onto Peg Base P_T
    ; Source D is resting on P_S base. Target P_T is an empty peg base.
    (:action move-base-to-base
        :parameters (?d - disk ?p_s - peg ?p_t - peg)
        :precondition (and
            (clear ?d)
            (on-base ?d ?p_s)
            (clear-base ?p_t)
            (not (= ?p_s ?p_t)) ; Must move between distinct pegs
        )
        :effect (and
            (on-base ?d ?p_t)
            (clear-base ?p_s)
            (not (on-base ?d ?p_s))
            (not (clear-base ?p_t))
        )
    )
)