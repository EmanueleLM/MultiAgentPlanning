(define (domain hanoi-4disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        locatable
        disk peg - locatable
    )
    (:predicates
        (on ?d - disk ?l - locatable)
        (clear ?l - locatable) ; L is clear if nothing is on top of it (applies to top disk or empty peg)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost) - number
    )

    ; Action 1: Moving a disk D onto an empty peg P. F is the original base (disk or peg).
    (:action move-to-empty-peg
        :parameters (?d - disk ?f - locatable ?p - peg)
        :precondition
            (and
                (on ?d ?f)   ; D is currently on F
                (clear ?d)   ; D is the top disk (can be moved)
                (clear ?p)   ; P is empty
            )
        :effect
            (and
                (not (on ?d ?f))
                (on ?d ?p)
                (clear ?f)   ; F is now exposed
                (not (clear ?p)) ; P is now covered by D
                (increase (total-cost) 1)
            )
    )

    ; Action 2: Moving a disk D1 onto a larger disk D2. F is the original base.
    (:action move-to-disk
        :parameters (?d1 - disk ?f - locatable ?d2 - disk)
        :precondition
            (and
                (on ?d1 ?f)
                (clear ?d1)   ; D1 is the top disk
                (clear ?d2)   ; D2 is currently uncovered
                (smaller ?d1 ?d2) ; Size constraint: D1 must be smaller than D2
            )
        :effect
            (and
                (not (on ?d1 ?f))
                (on ?d1 ?d2)
                (clear ?f)   ; F is now exposed
                (not (clear ?d2)) ; D2 is now covered
                (increase (total-cost) 1)
            )
    )
)