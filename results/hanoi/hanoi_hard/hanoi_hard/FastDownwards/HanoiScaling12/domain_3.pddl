(define (domain hanoi-6disk)
    (:requirements :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (at-peg ?d - disk ?p - peg) ; d is the bottom disk on peg p
        (clear ?d - disk) ; d has nothing on it (is available for moving)
        (empty ?p - peg) ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )

    ;; 1. Move disk D1 from disk D2 to disk D3
    (:action move-d-to-d
        :parameters (?d1 - disk ?d2 - disk ?d3 - disk)
        :precondition (and
            (clear ?d1)     ; D1 must be the top disk
            (on ?d1 ?d2)    ; D1 is currently on D2
            (clear ?d3)     ; D3 must be available as a target surface
            (smaller ?d1 ?d3) ; HARD CONSTRAINT: D1 must be smaller than D3
        )
        :effect (and
            (not (on ?d1 ?d2))
            (clear ?d2)     ; D2 is now exposed

            (on ?d1 ?d3)
            (not (clear ?d3)) ; D3 is now covered
        )
    )

    ;; 2. Move disk D1 from disk D2 to empty peg P_dst
    (:action move-d-to-p-from-d
        :parameters (?d1 - disk ?d2 - disk ?p_dst - peg)
        :precondition (and
            (clear ?d1)
            (on ?d1 ?d2)
            (empty ?p_dst)  ; P_dst must be empty
        )
        :effect (and
            (not (on ?d1 ?d2))
            (clear ?d2)

            (at-peg ?d1 ?p_dst)
            (not (empty ?p_dst))
        )
    )

    ;; 3. Move disk D1 from peg P_src (D1 is bottom disk) to disk D3
    (:action move-d-to-d-from-p
        :parameters (?d1 - disk ?d3 - disk ?p_src - peg)
        :precondition (and
            (clear ?d1)
            (at-peg ?d1 ?p_src) ; D1 is currently the only disk or the bottom disk
            (clear ?d3)
            (smaller ?d1 ?d3) ; HARD CONSTRAINT: D1 must be smaller than D3
        )
        :effect (and
            (not (at-peg ?d1 ?p_src))
            (empty ?p_src) ; P_src becomes empty (as D1 must be the only disk if it is both clear and at-peg)

            (on ?d1 ?d3)
            (not (clear ?d3))
        )
    )

    ;; 4. Move disk D1 from peg P_src to empty peg P_dst (Single disk transfer)
    (:action move-d-to-p-from-p
        :parameters (?d1 - disk ?p_src - peg ?p_dst - peg)
        :precondition (and
            (clear ?d1)
            (at-peg ?d1 ?p_src)
            (empty ?p_dst)
            (not (= ?p_src ?p_dst))
        )
        :effect (and
            (not (at-peg ?d1 ?p_src))
            (empty ?p_src)

            (at-peg ?d1 ?p_dst)
            (not (empty ?p_dst))
        )
    )
)