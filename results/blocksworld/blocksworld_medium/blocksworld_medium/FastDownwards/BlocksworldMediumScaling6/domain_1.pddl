(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        block
    )
    
    (:predicates
        (on ?b1 - block ?b2 - block)
        (on-table ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (hand-empty)
    )

    (:action pick-up
        :parameters (?b - block)
        :precondition (and (on-table ?b)
                           (clear ?b)
                           (hand-empty))
        :effect (and (holding ?b)
                     (not (on-table ?b))
                     (not (clear ?b)) ; Block is picked up, hence not clear by definition.
                     (not (hand-empty))
                )
    )

    (:action unstack
        :parameters (?b - block ?c - block)
        :precondition (and (on ?b ?c)
                           (clear ?b)
                           (hand-empty))
        :effect (and (holding ?b)
                     (clear ?c)        ; ?c is now clear
                     (not (on ?b ?c))
                     (not (clear ?b))  ; ?b is now held, hence not clear.
                     (not (hand-empty))
                )
    )
    
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and (on-table ?b)
                     (clear ?b)        ; ?b is put down, hence clear.
                     (hand-empty)
                     (not (holding ?b))
                )
    )

    (:action stack
        :parameters (?b - block ?c - block)
        :precondition (and (holding ?b)
                           (clear ?c))
        :effect (and (on ?b ?c)
                     (clear ?b)        ; ?b is placed down, hence clear.
                     (not (clear ?c))  ; ?c now has ?b on top, so it is not clear.
                     (hand-empty)
                     (not (holding ?b))
                )
    )
)