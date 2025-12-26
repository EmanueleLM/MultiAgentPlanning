(define (domain hanoi-7-disks-strips)
    (:requirements :strips :typing :negative-preconditions :equality :action-costs)
    (:types
        disk
        peg
    )
    (:functions
        (total-cost)
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)         ; d1 is on disk d2
        (on-peg ?d - disk ?p - peg)        ; d is the base disk on peg p
        (clear-disk ?d - disk)             ; nothing is on disk d (it is the top disk)
        (clear-peg ?p - peg)               ; peg p is empty
        (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2 (static)
        (is-on ?d - disk ?p - peg)         ; d is located somewhere on peg p
    )

    ;; Action 1: Move disk D from disk B (on FROM) onto disk T (on TO)
    (:action move-disk-disk
        :parameters (?d - disk  ; Moving disk (top of FROM stack)
                     ?b - disk  ; Base disk D is moving from (D is on B)
                     ?t - disk  ; Target disk D is moving onto (T is top of TO stack)
                     ?from - peg
                     ?to - peg
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (clear-disk ?t) ; Target T must be clear (top of stack)
            (on ?d ?b)
            (is-on ?b ?from)
            (is-on ?t ?to)
            (smaller ?d ?t) ; Size constraint: D must be smaller than T
        )
        :effect (and
            (not (on ?d ?b))
            (clear-disk ?b) ; B is now clear (new top of FROM stack)
            (not (is-on ?d ?from))

            (on ?d ?t)
            (not (clear-disk ?t)) ; T is no longer clear
            (is-on ?d ?to)
            (increase (total-cost) 1)
        )
    )
    
    ;; Action 2: Move disk D from disk B (on FROM) onto empty peg TO
    (:action move-disk-peg
        :parameters (?d - disk  ; Moving disk (top of FROM stack)
                     ?b - disk  ; Base disk D is moving from (D is on B)
                     ?from - peg
                     ?to - peg  ; Target peg (must be clear)
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (on ?d ?b)
            (is-on ?b ?from)
            (clear-peg ?to) ; Target peg must be empty
        )
        :effect (and
            (not (on ?d ?b))
            (clear-disk ?b) ; B is now clear
            (not (is-on ?d ?from))

            (on-peg ?d ?to) ; D becomes the new base disk of TO
            (not (clear-peg ?to))
            (is-on ?d ?to)
            (increase (total-cost) 1)
        )
    )
    
    ;; Action 3: Move disk D (base of FROM stack) onto disk T (on TO)
    (:action move-peg-disk
        :parameters (?d - disk  ; Moving disk (top of FROM stack, also the base disk)
                     ?from - peg
                     ?t - disk  ; Target disk D is moving onto
                     ?to - peg
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)    ; D is the top disk
            (on-peg ?d ?from)  ; D is the base of FROM (meaning D is the only disk on FROM)
            (is-on ?t ?to)
            (clear-disk ?t)    ; Target T must be clear
            (smaller ?d ?t)    ; Size constraint: D must be smaller than T
        )
        :effect (and
            (not (on-peg ?d ?from))
            (clear-peg ?from) ; FROM peg is now empty
            (not (is-on ?d ?from))

            (on ?d ?t)
            (not (clear-disk ?t)) ; T is no longer clear
            (is-on ?d ?to)
            (increase (total-cost) 1)
        )
    )
    
    ;; Action 4: Move disk D (base of FROM stack) onto empty peg TO
    (:action move-peg-peg
        :parameters (?d - disk  ; Moving disk (base of FROM)
                     ?from - peg
                     ?to - peg  ; Target peg (must be clear)
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (on-peg ?d ?from) ; D is the base disk and the top disk
            (is-on ?d ?from)
            (clear-peg ?to)
        )
        :effect (and
            (not (on-peg ?d ?from))
            (clear-peg ?from) ; FROM peg is now empty
            (not (is-on ?d ?from))
            
            (on-peg ?d ?to)
            (not (clear-peg ?to))
            (is-on ?d ?to)
            (increase (total-cost) 1)
        )
    )
)