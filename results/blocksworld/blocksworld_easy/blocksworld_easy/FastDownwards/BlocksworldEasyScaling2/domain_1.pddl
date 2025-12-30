(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg) ; d is directly on p
        (clear-disk ?d - disk) ; No disk is on d
        (clear-peg ?p - peg) ; No disk is on p
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static size constraint)
    )

    (:functions
        (total-cost)
    )

    ; --- Action 1: Move Disk from Disk to Peg ---
    (:action move_disk_from_disk_to_peg
        :parameters (?d - disk ?src_d - disk ?dst_p - peg)
        :precondition (and
            (clear-disk ?d)
            (clear-peg ?dst_p)
            (on ?d ?src_d)
        )
        :effect (and
            (not (on ?d ?src_d))
            (on-peg ?d ?dst_p)
            (not (clear-peg ?dst_p))
            (clear-disk ?src_d)
            (increase (total-cost) 1)
        )
    )

    ; --- Action 2: Move Disk from Peg to Peg ---
    (:action move_disk_from_peg_to_peg
        :parameters (?d - disk ?src_p - peg ?dst_p - peg)
        :precondition (and
            (clear-disk ?d)
            (clear-peg ?dst_p)
            (on-peg ?d ?src_p)
            (not (= ?src_p ?dst_p))
        )
        :effect (and
            (not (on-peg ?d ?src_p))
            (on-peg ?d ?dst_p)
            (not (clear-peg ?dst_p))
            (clear-peg ?src_p)
            (increase (total-cost) 1)
        )
    )

    ; --- Action 3: Move Disk from Disk to Disk (Check size constraint) ---
    (:action move_disk_from_disk_to_disk
        :parameters (?d - disk ?src_d - disk ?dst_d - disk)
        :precondition (and
            (clear-disk ?d)
            (clear-disk ?dst_d)
            (on ?d ?src_d)
            (smaller ?d ?dst_d) ; Hanoi Constraint: D must be smaller than Dst_D
        )
        :effect (and
            (not (on ?d ?src_d))
            (on ?d ?dst_d)
            (not (clear-disk ?dst_d))
            (clear-disk ?src_d)
            (increase (total-cost) 1)
        )
    )

    ; --- Action 4: Move Disk from Peg to Disk (Check size constraint) ---
    (:action move_disk_from_peg_to_disk
        :parameters (?d - disk ?src_p - peg ?dst_d - disk)
        :precondition (and
            (clear-disk ?d)
            (clear-disk ?dst_d)
            (on-peg ?d ?src_p)
            (smaller ?d ?dst_d) ; Hanoi Constraint: D must be smaller than Dst_D
        )
        :effect (and
            (not (on-peg ?d ?src_p))
            (on ?d ?dst_d)
            (not (clear-disk ?dst_d))
            (clear-peg ?src_p)
            (increase (total-cost) 1)
        )
    )
)