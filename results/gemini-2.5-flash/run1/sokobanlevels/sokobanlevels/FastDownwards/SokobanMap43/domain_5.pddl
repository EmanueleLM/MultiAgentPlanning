(define (domain sokoban_map43)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        agent
        box_object
        location
    )
    (:predicates
        (at_player ?p - agent ?l - location)
        (at_box ?b - box_object ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (connected_left ?l1 - location ?l2 - location)
        (connected_right ?l1 - location ?l2 - location)
        (connected_up ?l1 - location ?l2 - location)
        (connected_down ?l1 - location ?l2 - location)
    )

    ;; Player moves left
    (:action move_player_left
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (connected_left ?from ?to)
                           (not (is_wall ?to))
                           (not (at_box ?b_any - box_object ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to)))

    ;; Player moves right
    (:action move_player_right
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (connected_right ?from ?to)
                           (not (is_wall ?to))
                           (not (at_box ?b_any - box_object ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to)))

    ;; Player moves up
    (:action move_player_up
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (connected_up ?from ?to)
                           (not (is_wall ?to))
                           (not (at_box ?b_any - box_object ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to)))

    ;; Player moves down
    (:action move_player_down
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (connected_down ?from ?to)
                           (not (is_wall ?to))
                           (not (at_box ?b_any - box_object ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to)))

    ;; Player pushes box left
    (:action push_box_left
        :parameters (?p - agent ?b - box_object ?player_pos - location ?box_pos - location ?target_pos - location)
        :precondition (and (at_player ?p ?player_pos)
                           (at_box ?b ?box_pos)
                           (connected_left ?player_pos ?box_pos)
                           (connected_left ?box_pos ?target_pos)
                           (not (is_wall ?target_pos))
                           (not (at_box ?b_other - box_object ?target_pos))
                           (not (at_player ?p_other - agent ?target_pos)))
        :effect (and (not (at_player ?p ?player_pos))
                     (at_player ?p ?box_pos)
                     (not (at_box ?b ?box_pos))
                     (at_box ?b ?target_pos)))

    ;; Player pushes box right
    (:action push_box_right
        :parameters (?p - agent ?b - box_object ?player_pos - location ?box_pos - location ?target_pos - location)
        :precondition (and (at_player ?p ?player_pos)
                           (at_box ?b ?box_pos)
                           (connected_right ?player_pos ?box_pos)
                           (connected_right ?box_pos ?target_pos)
                           (not (is_wall ?target_pos))
                           (not (at_box ?b_other - box_object ?target_pos))
                           (not (at_player ?p_other - agent ?target_pos)))
        :effect (and (not (at_player ?p ?player_pos))
                     (at_player ?p ?box_pos)
                     (not (at_box ?b ?box_pos))
                     (at_box ?b ?target_pos)))

    ;; Player pushes box up
    (:action push_box_up
        :parameters (?p - agent ?b - box_object ?player_pos - location ?box_pos - location ?target_pos - location)
        :precondition (and (at_player ?p ?player_pos)
                           (at_box ?b ?box_pos)
                           (connected_up ?player_pos ?box_pos)
                           (connected_up ?box_pos ?target_pos)
                           (not (is_wall ?target_pos))
                           (not (at_box ?b_other - box_object ?target_pos))
                           (not (at_player ?p_other - agent ?target_pos)))
        :effect (and (not (at_player ?p ?player_pos))
                     (at_player ?p ?box_pos)
                     (not (at_box ?b ?box_pos))
                     (at_box ?b ?target_pos)))

    ;; Player pushes box down
    (:action push_box_down
        :parameters (?p - agent ?b - box_object ?player_pos - location ?box_pos - location ?target_pos - location)
        :precondition (and (at_player ?p ?player_pos)
                           (at_box ?b ?box_pos)
                           (connected_down ?player_pos ?box_pos)
                           (connected_down ?box_pos ?target_pos)
                           (not (is_wall ?target_pos))
                           (not (at_box ?b_other - box_object ?target_pos))
                           (not (at_player ?p_other - agent ?target_pos)))
        :effect (and (not (at_player ?p ?player_pos))
                     (at_player ?p ?box_pos)
                     (not (at_box ?b ?box_pos))
                     (at_box ?b ?target_pos)))
)