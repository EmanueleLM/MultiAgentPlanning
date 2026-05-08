(define (domain sokoban-map37)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types cell)
    (:predicates
        (at_player ?c - cell)
        (at_box ?c - cell)
        (is_goal ?c - cell)
        (is_wall ?c - cell)
        (east ?c1 - cell ?c2 - cell) ; ?c2 is immediately to the east (right) of ?c1
        (west ?c1 - cell ?c2 - cell) ; ?c2 is immediately to the west (left) of ?c1
    )

    (:functions
        (total-cost)
    )

    ;; Player movement actions
    ;; Move Left (player moves from ?px to ?nx, where ?nx is left of ?px)
    (define (action move-left)
        :parameters (?px ?nx - cell)
        :precondition (and
            (at_player ?px)
            (west ?px ?nx) ; ?nx is west of ?px
            (not (is_wall ?nx))
            (not (at_box ?nx))
        )
        :effect (and
            (not (at_player ?px))
            (at_player ?nx)
            (increase (total-cost) 1)
        )
    )

    ;; Move Right (player moves from ?px to ?nx, where ?nx is right of ?px)
    (define (action move-right)
        :parameters (?px ?nx - cell)
        :precondition (and
            (at_player ?px)
            (east ?px ?nx) ; ?nx is east of ?px
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
    ;; Push Box Left (player at ?px pushes box at ?bx to ?tx, all moving left)
    (define (action push-left)
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

    ;; Push Box Right (player at ?px pushes box at ?bx to ?tx, all moving right)
    (define (action push-right)
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