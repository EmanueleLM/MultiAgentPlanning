(define (domain hanoi-6disk)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg) ; d is directly on peg p (bottom disk)
        (clear ?d - disk) ; d has nothing on top
        (peg-empty ?p - peg) ; p has nothing on it

        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )

    ;; 1. Move D resting on S_disk, to land on T_disk
    (:action move-from-disk-to-disk
        :parameters (?d - disk ?s_disk - disk ?t_disk - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?s_disk)
            (clear ?t_disk)
            (smaller ?d ?t_disk)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?s_disk))
            (clear ?s_disk)
            
            (on ?d ?t_disk)
            (not (clear ?t_disk))
        )
    )
    
    ;; 2. Move D resting on S_disk, to land on P_to (empty peg)
    (:action move-from-disk-to-peg
        :parameters (?d - disk ?s_disk - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?s_disk)
            (peg-empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?s_disk))
            (clear ?s_disk)
            
            (on-peg ?d ?p_to) ; D becomes the new bottom disk
            (not (peg-empty ?p_to))
        )
    )
    
    ;; 3. Move D resting on P_from (bottom disk), to land on T_disk
    (:action move-from-peg-to-disk
        :parameters (?d - disk ?t_disk - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_from) ; D is the bottom disk
            (clear ?t_disk)
            (smaller ?d ?t_disk)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (peg-empty ?p_from) ; P_from is now empty
            
            (on ?d ?t_disk)
            (not (clear ?t_disk))
        )
    )
    
    ;; 4. Move D resting on P_from (bottom disk), to land on P_to (empty peg)
    (:action move-from-peg-to-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_from)
            (peg-empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (peg-empty ?p_from)
            
            (on-peg ?d ?p_to)
            (not (peg-empty ?p_to))
        )
    )
)