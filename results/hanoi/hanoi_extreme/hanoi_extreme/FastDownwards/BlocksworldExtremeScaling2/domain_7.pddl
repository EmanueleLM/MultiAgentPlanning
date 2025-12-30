(define (domain tower_of_hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is directly on d2
        (base ?d - disk ?p - peg)  ; d is the bottom disk resting on peg p
        (clear ?d - disk)          ; d has nothing on top
        (peg-empty ?p - peg)       ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; Static: d1 is smaller than d2
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Move D from D_BELOW to D_UNDER (Disk stack transfer)
    (:action move-disk-to-disk
        :parameters (?d ?d_below ?d_under - disk ?p - peg ?q - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_below)
            (clear ?d_under)
            (smaller ?d ?d_under)
            (not (= ?p ?q))
        )
        :effect (and
            (not (on ?d ?d_below))
            (not (clear ?d_under))
            (on ?d ?d_under)
            (clear ?d_below)
            (increase (total-cost) 1)
        )
    )
    
    ;; 2. Move D from D_BELOW to PEG Q (empty target base)
    (:action move-disk-to-base
        :parameters (?d ?d_below - disk ?p - peg ?q - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_below)
            (peg-empty ?q)
            (not (= ?p ?q))
        )
        :effect (and
            (not (on ?d ?d_below))
            (not (peg-empty ?q))
            (base ?d ?q)
            (clear ?d_below)
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. Move D from PEG P (base disk) to D_UNDER
    (:action move-base-to-disk
        :parameters (?d ?d_under - disk ?p - peg ?q - peg)
        :precondition (and
            (clear ?d)
            (base ?d ?p)
            (clear ?d_under)
            (smaller ?d ?d_under)
            (not (= ?p ?q))
        )
        :effect (and
            (not (base ?d ?p))
            (not (clear ?d_under))
            (on ?d ?d_under)
            (peg-empty ?p)
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move D from PEG P (base disk) to PEG Q (empty target base)
    (:action move-base-to-base
        :parameters (?d - disk ?p - peg ?q - peg)
        :precondition (and
            (clear ?d)
            (base ?d ?p)
            (peg-empty ?q)
            (not (= ?p ?q))
        )
        :effect (and
            (not (base ?d ?p))
            (not (peg-empty ?q))
            (base ?d ?q)
            (peg-empty ?p)
            (increase (total-cost) 1)
        )
    )
)