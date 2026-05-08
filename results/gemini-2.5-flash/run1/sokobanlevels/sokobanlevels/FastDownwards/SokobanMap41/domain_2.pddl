(define (domain sokoban_map41)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        player
        box
        location
    )
    (:predicates
        (at_player ?p - player ?l - location) ; Corrected: player object is now a parameter
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (free ?l - location) ; true if location is not occupied by player or box
        (left_of ?l1 ?l2 - location) ; l1 is immediately to the left of l2
        (right_of ?l1 ?l2 - location) ; l1 is immediately to the right of l2
        (above_of ?l1 ?l2 - location) ; l1 is immediately above l2
        (below_of ?l1 ?l2 - location) ; l1 is immediately below l2
    )

    ;; Player movement
    (:action move_left
        :parameters (?p - player ?from ?to - location)
        :precondition (and (at_player ?p ?from)
                           (left_of ?to ?from)
                           (free ?to)
                           (not (is_wall ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to)
                     (not (free ?to))
                     (free ?from)))

    (:action move_right
        :parameters (?p - player ?from ?to - location)
        :precondition (and (at_player ?p ?from)
                           (right_of ?to ?from)
                           (free ?to)
                           (not (is_wall ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to)
                     (not (free ?to))
                     (free ?from)))

    (:action move_up
        :parameters (?p - player ?from ?to - location)
        :precondition (and (at_player ?p ?from)
                           (above_of ?to ?from)
                           (free ?to)
                           (not (is_wall ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to)
                     (not (free ?to))
                     (free ?from)))

    (:action move_down
        :parameters (?p - player ?from ?to - location)
        :precondition (and (at_player ?p ?from)
                           (below_of ?to ?from)
                           (free ?to)
                           (not (is_wall ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to)
                     (not (free ?to))
                     (free ?from)))

    ;; Box pushing
    (:action push_left
        :parameters (?p - player ?b - box ?p_from ?b_from ?b_to - location)
        :precondition (and (at_player ?p ?p_from)
                           (at_box ?b ?b_from)
                           (left_of ?b_to ?b_from) ; Box moves left
                           (right_of ?p_from ?b_from) ; Player must be to the right of the box
                           (free ?b_to)
                           (not (is_wall ?b_to)))
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from) ; Player moves to box's original spot
                     (not (at_box ?b ?b_from))
                     (at_box ?b ?b_to)
                     (not (free ?b_to)) ; Box's new spot is no longer free
                     (free ?p_from))) ; Player's old spot is now free

    (:action push_right
        :parameters (?p - player ?b - box ?p_from ?b_from ?b_to - location)
        :precondition (and (at_player ?p ?p_from)
                           (at_box ?b ?b_from)
                           (right_of ?b_to ?b_from) ; Box moves right
                           (left_of ?p_from ?b_from) ; Player must be to the left of the box
                           (free ?b_to)
                           (not (is_wall ?b_to)))
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box ?b ?b_from))
                     (at_box ?b ?b_to)
                     (not (free ?b_to))
                     (free ?p_from)))

    (:action push_up
        :parameters (?p - player ?b - box ?p_from ?b_from ?b_to - location)
        :precondition (and (at_player ?p ?p_from)
                           (at_box ?b ?b_from)
                           (above_of ?b_to ?b_from) ; Box moves up
                           (below_of ?p_from ?b_from) ; Player must be below the box
                           (free ?b_to)
                           (not (is_wall ?b_to)))
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box ?b ?b_from))
                     (at_box ?b ?b_to)
                     (not (free ?b_to))
                     (free ?p_from)))

    (:action push_down
        :parameters (?p - player ?b - box ?p_from ?b_from ?b_to - location)
        :precondition (and (at_player ?p ?p_from)
                           (at_box ?b ?b_from)
                           (below_of ?b_to ?b_from) ; Box moves down
                           (above_of ?p_from ?b_from) ; Player must be above the box
                           (free ?b_to)
                           (not (is_wall ?b_to)))
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box ?b ?b_from))
                     (at_box ?b ?b_to)
                     (not (free ?b_to))
                     (free ?p_from)))
)