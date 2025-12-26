(define (domain blocksworld_planning)
    (:requirements :strips :typing)
    (:types block)
    
    (:predicates
        (on ?x - block ?y - block)
        (on_table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand_empty)
    )

    ;; PICK UP: Block from Table to Hand (Rule 3: Block must be on table and clear. Rule 2: Hand empty.)
    (:action pick-up
        :parameters (?b - block)
        :precondition (and (hand_empty) (on_table ?b) (clear ?b))
        :effect (and (not (on_table ?b)) (not (clear ?b)) (not (hand_empty)) (holding ?b))
    )

    ;; UNSTACK: Block from Block to Hand (Rule 5: B1 on B2, B1 clear. Rule 2: Hand empty.)
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (hand_empty) (on ?b1 ?b2) (clear ?b1))
        :effect (and (not (on ?b1 ?b2)) (not (clear ?b1)) (not (hand_empty)) (holding ?b1) (clear ?b2))
    )

    ;; PUT DOWN: Block from Hand to Table (Rule 6: Holding B.)
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and (not (holding ?b)) (hand_empty) (on_table ?b) (clear ?b))
    )

    ;; STACK: Block from Hand onto Block (Rule 7: Holding B1, B2 clear.)
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (holding ?b1) (clear ?b2) (not (= ?b1 ?b2)))
        :effect (and (not (holding ?b1)) (hand_empty) (on ?b1 ?b2) (not (clear ?b2)) (clear ?b1))
    )
)