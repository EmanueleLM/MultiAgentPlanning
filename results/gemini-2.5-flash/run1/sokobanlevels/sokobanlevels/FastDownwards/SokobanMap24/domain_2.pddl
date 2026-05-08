(define (domain sokobanmap24)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box location)
    (:predicates
        (player_at ?l - location)
        (box_at ?l - location)
        (is_goal ?l - location)
        (adj_north ?l_south ?l_north - location)
        (adj_south ?l_north ?l_south - location)
    )

    ;; Player moves one step up
    (:action move_up
        :parameters (?from - location ?to - location)
        :precondition (and (player_at ?from)
                           (adj_north ?from ?to)
                           (not (box_at ?to)))
        :effect (and (not (player_at ?from))
                     (player_at ?to)))

    ;; Player moves one step down
    (:action move_down
        :parameters (?from - location ?to - location)
        :precondition (and (player_at ?from)
                           (adj_south ?from ?to)
                           (not (box_at ?to)))
        :effect (and (not (player_at ?from))
                     (player_at ?to)))

    ;; Player pushes the box up
    (:action push_box_up
        :parameters (?p_loc - location ?b_loc - location ?b_target - location)
        :precondition (and (player_at ?p_loc)
                           (box_at ?b_loc)
                           (adj_south ?p_loc ?b_loc) ; Player is below the box, pushing up
                           (adj_north ?b_loc ?b_target) ; Box moves to a location north of its current
                           (not (box_at ?b_target)))
        :effect (and (not (player_at ?p_loc))
                     (player_at ?b_loc) ; Player moves into the box's old spot
                     (not (box_at ?b_loc))
                     (box_at ?b_target)))

    ;; Player pushes the box down
    (:action push_box_down
        :parameters (?p_loc - location ?b_loc - location ?b_target - location)
        :precondition (and (player_at ?p_loc)
                           (box_at ?b_loc)
                           (adj_north ?p_loc ?b_loc) ; Player is above the box, pushing down
                           (adj_south ?b_loc ?b_target) ; Box moves to a location south of its current
                           (not (box_at ?b_target)))
        :effect (and (not (player_at ?p_loc))
                     (player_at ?b_loc) ; Player moves into the box's old spot
                     (not (box_at ?b_loc))
                     (box_at ?b_target)))
)