(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk object
        peg object
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (size hierarchy)
        (on ?d1 - disk ?d2 - disk)      ; d1 immediately on d2
        (on-base ?d - disk ?p - peg)    ; d is on the base of peg p
        (clear ?d - disk)               ; d has nothing on top (is movable)
        (peg-empty ?p - peg)            ; Peg p has no disks
        (at ?d - disk ?p - peg)         ; d is located at peg p
    )

    ;; Action A: Move D from Base(FROM) to Empty Peg (TO)
    (:action move_disk_base_to_empty_peg
        :parameters (?d - disk ?from - peg ?to - peg)
        :precondition (and
            (not (= ?from ?to))
            (at ?d ?from)
            (on-base ?d ?from)
            (clear ?d)
            (peg-empty ?to)
        )
        :effect (and
            (not (on-base ?d ?from))
            (on-base ?d ?to)
            (not (peg-empty ?to))
            (peg-empty ?from) 
            (not (at ?d ?from))
            (at ?d ?to)
        )
    )

    ;; Action B: Move D from D_BELOW_F to Empty Peg (TO)
    (:action move_disk_onto_empty_peg
        :parameters (?d - disk ?from - peg ?to - peg ?d_below_f - disk)
        :precondition (and
            (not (= ?from ?to))
            (at ?d ?from)
            (on ?d ?d_below_f) 
            (clear ?d)
            (peg-empty ?to)
        )
        :effect (and
            (not (on ?d ?d_below_f))
            (on-base ?d ?to)
            (clear ?d_below_f) 
            (not (peg-empty ?to))
            (not (at ?d ?from))
            (at ?d ?to)
        )
    )

    ;; Action C: Move D from D_BELOW_F onto D_BELOW_T (Disk to Disk)
    (:action move_disk_onto_disk
        :parameters (?d - disk ?from - peg ?to - peg ?d_below_f - disk ?d_below_t - disk)
        :precondition (and
            (not (= ?from ?to))
            (at ?d ?from)
            (at ?d_below_t ?to) 
            
            (on ?d ?d_below_f)
            (clear ?d)
            
            (clear ?d_below_t) 
            (smaller ?d ?d_below_t) ; Size constraint enforcement
            (not (peg-empty ?to))
        )
        :effect (and
            (not (on ?d ?d_below_f))
            (on ?d ?d_below_t)
            (clear ?d_below_f) 
            (not (clear ?d_below_t)) 
            
            (not (at ?d ?from))
            (at ?d ?to)
        )
    )

    ;; Action D: Move D from Base(FROM) onto D_BELOW_T (Base to Disk)
    (:action move_disk_base_onto_disk
        :parameters (?d - disk ?from - peg ?to - peg ?d_below_t - disk)
        :precondition (and
            (not (= ?from ?to))
            (at ?d ?from)
            (at ?d_below_t ?to)
            
            (on-base ?d ?from)
            (clear ?d)
            
            (clear ?d_below_t) 
            (smaller ?d ?d_below_t) ; Size constraint enforcement
            (not (peg-empty ?to))
        )
        :effect (and
            (not (on-base ?d ?from))
            (on ?d ?d_below_t)
            (peg-empty ?from) 
            (not (clear ?d_below_t)) 
            
            (not (at ?d ?from))
            (at ?d ?to)
        )
    )
)