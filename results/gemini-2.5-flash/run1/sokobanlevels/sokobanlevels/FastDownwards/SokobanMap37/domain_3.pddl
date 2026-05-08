(define (domain sokoban-map37)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types cell)
    (:predicates
        (at_player ?c - cell)
        (at_box ?c - cell)
        (is_goal ?c - cell)
        (is_wall ?c - cell)
        (east ?c1 - cell ?c2 - cell)
        (west ?c1 - cell ?c2 - cell)
    )
    (:functions
        (total-cost)
    )

    ;; Player movement actions
    (action move-left
        :parameters (?px ?nx - cell)
        :precondition (and
            (at_player ?px)
            (west ?px ?nx)
            (not (is_wall ?nx))
            (not (at_box ?nx))
        )
        :effect (and
            (not (at_player ?px))
            (at_player ?nx)
            (increase (total-cost) 1)
        )
    )

    (action move-right
        :parameters (?px ?nx - cell)
        :precondition (and
            (at_player ?px)
            (east ?px ?nx)
            (not (is_wall ?nx))
            (not (at_box ?nx))
        )
        :effect (and
            (not (at_player ?px))
            (at_player ?nx)
            (increase (total-cost) 1)
        )
    )

    ;; Push box actions
    (action push-left
        :parameters (?px ?bx ?tx - cell)
        :precondition (and
            (at_player ?px)
            (at_box ?bx)
            (west ?px ?bx) ; Player is to the right of the box (?bx is west of ?px)
            (west ?bx ?tx) ; Box target is to the left of the box (?tx is west of ?bx)
            (not (is_wall ?tx))
            (not (at_box ?tx))
        )
        :effect (and
            (not (at_player ?px))
            (at_player ?bx) ; player moves to box's old spot
            (not (at_box ?bx))
            (at_box ?tx)    ; box moves to target spot
            (increase (total-cost) 1)
        )
    )

    (action push-right
        :parameters (?px ?bx ?tx - cell)
        :precondition (and
            (at_player ?px)
            (at_box ?bx)
            (east ?px ?bx) ; Player is to the left of the box (?bx is east of ?px)
            (east ?bx ?tx) ; Box target is to the right of the box (?tx is east of ?bx)
            (not (is_wall ?tx))
            (not (at_box ?tx))
        )
        :effect (and
            (not (at_player ?px))
            (at_player ?bx) ; player moves to box's old spot
            (not (at_box ?bx))
            (at_box ?tx)    ; box moves to target spot
            (increase (total-cost) 1)
        )
    )
)