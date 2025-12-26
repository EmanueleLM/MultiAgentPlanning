(define (domain hanoi-minimal)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg - object
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; Static size comparison (D1 < D2)
        (on ?d - disk ?l - object)      ; D is immediately on L (L can be a disk or a peg)
        (clear ?x - object)             ; X (disk or peg) has nothing placed on it
    )

    ;; 1. Move disk D off L_UNDER (disk) onto L_OVER (disk)
    (:action move-disk-to-disk
        :parameters (?d - disk
                     ?l_under - disk ; Disk D is moving off of (exposing L_UNDER)
                     ?l_over - disk  ; Disk D is moving onto (covering L_OVER)
        )
        :precondition (and
            (clear ?d)
            (on ?d ?l_under) 
            (clear ?l_over)
            (smaller ?d ?l_over) ; D must be smaller than the disk it lands on
        )
        :effect (and
            (not (on ?d ?l_under))
            (clear ?l_under)

            (on ?d ?l_over)
            (not (clear ?l_over))
        )
    )

    ;; 2. Move disk D off L_UNDER (disk) onto P_TO (peg)
    (:action move-disk-to-peg-empty
        :parameters (?d - disk
                     ?l_under - disk ; Disk D is moving off of (exposing L_UNDER)
                     ?p_to - peg     ; Peg D is moving onto (must be empty)
        )
        :precondition (and
            (clear ?d)
            (on ?d ?l_under)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?l_under))
            (clear ?l_under)

            (on ?d ?p_to)
            (not (clear ?p_to))
        )
    )
    
    ;; 3. Move disk D off P_FROM (peg) onto L_OVER (disk)
    (:action move-bottom-disk-to-disk
        :parameters (?d - disk
                     ?p_from - peg   ; Disk D is moving off of (emptying P_FROM)
                     ?l_over - disk  ; Disk D is moving onto (covering L_OVER)
        )
        :precondition (and
            (clear ?d)
            (on ?d ?p_from)         ; D is the disk directly on the peg
            (clear ?l_over)
            (smaller ?d ?l_over)    ; Size constraint
        )
        :effect (and
            (not (on ?d ?p_from))
            (clear ?p_from)         ; Peg is now empty

            (on ?d ?l_over)
            (not (clear ?l_over))
        )
    )

    ;; 4. Move disk D off P_FROM (peg) onto P_TO (peg)
    (:action move-bottom-disk-to-peg-empty
        :parameters (?d - disk
                     ?p_from - peg
                     ?p_to - peg
        )
        :precondition (and
            (clear ?d)
            (on ?d ?p_from)
            (clear ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?p_from))
            (clear ?p_from)

            (on ?d ?p_to)
            (not (clear ?p_to))
        )
    )
)