(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types disk peg)
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg) ; d is immediately on peg p
        (top-disk ?p - peg ?d - disk) ; d is the disk on top of peg p
        (empty ?p - peg) ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )

    ; 1. Move D from Peg P_From to empty Peg P_To (D must be the bottom disk on P_From)
    (:action move-bottom-to-empty
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (top-disk ?p_from ?d)
            (on-peg ?d ?p_from)
            (empty ?p_to)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            (empty ?p_from)
            (not (empty ?p_to))
            (not (top-disk ?p_from ?d))
            (top-disk ?p_to ?d)
        )
    )

    ; 2. Move D from Peg P_From onto Disk D_Under on Peg P_To (D must be the bottom disk on P_From)
    (:action move-bottom-to-disk
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?d_under - disk)
        :precondition (and
            (top-disk ?p_from ?d)
            (on-peg ?d ?p_from)
            (top-disk ?p_to ?d_under)
            (smaller ?d ?d_under) ; Strict size constraint
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?d_under)
            (empty ?p_from)
            (not (top-disk ?p_from ?d))
            (not (top-disk ?p_to ?d_under))
            (top-disk ?p_to ?d)
        )
    )

    ; 3. Move D from Disk D_X on P_From to empty Peg P_To
    (:action move-top-to-empty
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?d_x - disk)
        :precondition (and
            (top-disk ?p_from ?d)
            (on ?d ?d_x)
            (empty ?p_to)
        )
        :effect (and
            (not (on ?d ?d_x))
            (on-peg ?d ?p_to)
            (not (top-disk ?p_from ?d))
            (top-disk ?p_from ?d_x) ; D_X is the new top
            (not (empty ?p_to))
            (top-disk ?p_to ?d)
        )
    )

    ; 4. Move D from Disk D_X on P_From onto Disk D_Under on Peg P_To
    (:action move-top-to-disk
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?d_x - disk ?d_under - disk)
        :precondition (and
            (top-disk ?p_from ?d)
            (on ?d ?d_x)
            (top-disk ?p_to ?d_under)
            (smaller ?d ?d_under) ; Strict size constraint
        )
        :effect (and
            (not (on ?d ?d_x))
            (on ?d ?d_under)
            (not (top-disk ?p_from ?d))
            (not (top-disk ?p_to ?d_under))
            (top-disk ?p_from ?d_x)
            (top-disk ?p_to ?d)
        )
    )
)