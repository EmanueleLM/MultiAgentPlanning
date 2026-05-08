(define (domain sokoban_map22)
    (:requirements :strips :typing :negative-preconditions)
    (:types agent box_type location)
    (:predicates
        (at ?obj - (or agent box_type) ?loc - location)
        (is_goal ?loc - location)
        (is_wall ?loc - location)
        (clear ?loc - location)
        (adj_up ?l1 ?l2 - location)
        (adj_down ?l1 ?l2 - location)
        (adj_left ?l1 ?l2 - location)
        (adj_right ?l1 ?l2 - location)
    )

    ;; Player movement actions
    (:action move_up
        :parameters (?p - agent ?l1 ?l2 - location)
        :precondition (and (at ?p ?l1)
                           (adj_up ?l1 ?l2)
                           (clear ?l2)
                           (not (is_wall ?l2)))
        :effect (and (not (at ?p ?l1))
                     (at ?p ?l2)
                     (not (clear ?l2))
                     (clear ?l1)))

    (:action move_down
        :parameters (?p - agent ?l1 ?l2 - location)
        :precondition (and (at ?p ?l1)
                           (adj_down ?l1 ?l2)
                           (clear ?l2)
                           (not (is_wall ?l2)))
        :effect (and (not (at ?p ?l1))
                     (at ?p ?l2)
                     (not (clear ?l2))
                     (clear ?l1)))

    (:action move_left
        :parameters (?p - agent ?l1 ?l2 - location)
        :precondition (and (at ?p ?l1)
                           (adj_left ?l1 ?l2)
                           (clear ?l2)
                           (not (is_wall ?l2)))
        :effect (and (not (at ?p ?l1))
                     (at ?p ?l2)
                     (not (clear ?l2))
                     (clear ?l1)))

    (:action move_right
        :parameters (?p - agent ?l1 ?l2 - location)
        :precondition (and (at ?p ?l1)
                           (adj_right ?l1 ?l2)
                           (clear ?l2)
                           (not (is_wall ?l2)))
        :effect (and (not (at ?p ?l1))
                     (at ?p ?l2)
                     (not (clear ?l2))
                     (clear ?l1)))

    ;; Box pushing actions
    (:action push_up
        :parameters (?p - agent ?b - box_type ?l_player ?l_box ?l_target - location)
        :precondition (and (at ?p ?l_player)
                           (at ?b ?l_box)
                           (adj_up ?l_player ?l_box) ; Player is below box
                           (adj_up ?l_box ?l_target) ; Box is below target
                           (clear ?l_target)
                           (not (is_wall ?l_target)))
        :effect (and (not (at ?p ?l_player))
                     (at ?p ?l_box)          ; Player moves to box's old spot
                     (not (at ?b ?l_box))
                     (at ?b ?l_target)        ; Box moves to target spot
                     (clear ?l_player)        ; Player's old spot becomes clear
                     (not (clear ?l_target)))) ; Box's new spot is no longer clear

    (:action push_down
        :parameters (?p - agent ?b - box_type ?l_player ?l_box ?l_target - location)
        :precondition (and (at ?p ?l_player)
                           (at ?b ?l_box)
                           (adj_down ?l_player ?l_box) ; Player is above box
                           (adj_down ?l_box ?l_target) ; Box is above target
                           (clear ?l_target)
                           (not (is_wall ?l_target)))
        :effect (and (not (at ?p ?l_player))
                     (at ?p ?l_box)
                     (not (at ?b ?l_box))
                     (at ?b ?l_target)
                     (clear ?l_player)
                     (not (clear ?l_target))))

    (:action push_left
        :parameters (?p - agent ?b - box_type ?l_player ?l_box ?l_target - location)
        :precondition (and (at ?p ?l_player)
                           (at ?b ?l_box)
                           (adj_left ?l_player ?l_box) ; Player is to the right of box
                           (adj_left ?l_box ?l_target) ; Box is to the right of target
                           (clear ?l_target)
                           (not (is_wall ?l_target)))
        :effect (and (not (at ?p ?l_player))
                     (at ?p ?l_box)
                     (not (at ?b ?l_box))
                     (at ?b ?l_target)
                     (clear ?l_player)
                     (not (clear ?l_target))))

    (:action push_right
        :parameters (?p - agent ?b - box_type ?l_player ?l_box ?l_target - location)
        :precondition (and (at ?p ?l_player)
                           (at ?b ?l_box)
                           (adj_right ?l_player ?l_box) ; Player is to the left of box
                           (adj_right ?l_box ?l_target) ; Box is to the left of target
                           (clear ?l_target)
                           (not (is_wall ?l_target)))
        :effect (and (not (at ?p ?l_player))
                     (at ?p ?l_box)
                     (not (at ?b ?l_box))
                     (at ?b ?l_target)
                     (clear ?l_player)
                     (not (clear ?l_target))))
)