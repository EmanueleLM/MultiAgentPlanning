(define (domain hanoi-4disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )

    (:predicates
        (on ?d - disk ?p - peg)         ; d is resting directly on peg p (d is the base disk)
        (on-disk ?d1 - disk ?d2 - disk) ; d1 is resting directly on d2
        (clear ?d - disk)               ; d has nothing on top
        (empty ?p - peg)                ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Static)
    )

    ;; 1. Move disk D from being on Peg P_src to Peg P_dest (Empty destination)
    (:action move-from-peg-to-empty-peg
        :parameters (?d - disk ?p_src - peg ?p_dest - peg)
        :precondition (and
            (on ?d ?p_src)
            (clear ?d)
            (empty ?p_dest)
            (not (= ?p_src ?p_dest))
        )
        :effect (and
            (not (on ?d ?p_src))
            (not (empty ?p_dest))
            (on ?d ?p_dest)
            (empty ?p_src)
        )
    )

    ;; 2. Move disk D from being on Peg P_src to Disk D_dest
    ;; Requires D to be smaller than D_dest. D must be the base disk of P_src.
    (:action move-from-peg-to-disk
        :parameters (?d - disk ?p_src - peg ?d_dest - disk)
        :precondition (and
            (on ?d ?p_src)
            (clear ?d)
            (clear ?d_dest)
            (smaller ?d ?d_dest)
        )
        :effect (and
            (not (on ?d ?p_src))
            (not (clear ?d_dest))
            (on-disk ?d ?d_dest)
            (empty ?p_src)
        )
    )
    
    ;; 3. Move disk D from Disk D_under to Peg P_dest (Empty destination)
    (:action move-from-disk-to-empty-peg
        :parameters (?d - disk ?d_under - disk ?p_dest - peg)
        :precondition (and
            (on-disk ?d ?d_under)
            (clear ?d)
            (empty ?p_dest)
        )
        :effect (and
            (not (on-disk ?d ?d_under))
            (not (empty ?p_dest))
            (on ?d ?p_dest)
            (clear ?d_under)
        )
    )

    ;; 4. Move disk D from Disk D_under to Disk D_dest
    ;; Requires D to be smaller than D_dest.
    (:action move-from-disk-to-disk
        :parameters (?d - disk ?d_under - disk ?d_dest - disk)
        :precondition (and
            (on-disk ?d ?d_under)
            (clear ?d)
            (clear ?d_dest)
            (smaller ?d ?d_dest)
        )
        :effect (and
            (not (on-disk ?d ?d_under))
            (not (clear ?d_dest))
            (on-disk ?d ?d_dest)
            (clear ?d_under)
        )
    )
)