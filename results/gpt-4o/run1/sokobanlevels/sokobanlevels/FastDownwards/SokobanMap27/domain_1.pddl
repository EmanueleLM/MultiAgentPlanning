(define (domain sokoban)
    (:requirements :strips :typing)
    
    (:types 
        cell 
        movable_entity - cell
        pos - cell
    )
    
    (:predicates 
        (at ?entity - movable_entity ?position - pos)
        (adjacent ?p1 ?p2 - pos)
        (clear ?p - pos)
        (box_at_goal)
    )
    
    (:action move_up
        :parameters (?from ?to - pos)
        :precondition (and 
            (at player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at player ?from))
            (at player ?to)
        )
    )
    
    (:action move_down
        :parameters (?from ?to - pos)
        :precondition (and 
            (at player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at player ?from))
            (at player ?to)
        )
    )
    
    (:action move_left
        :parameters (?from ?to - pos)
        :precondition (and 
            (at player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at player ?from))
            (at player ?to)
        )
    )
    
    (:action move_right
        :parameters (?from ?to - pos)
        :precondition (and 
            (at player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at player ?from))
            (at player ?to)
        )
    )
    
    (:action push_up
        :parameters (?pfrom ?pto ?bfrom ?bto - pos)
        :precondition (and 
            (at player ?pfrom)
            (at box ?bfrom)
            (adjacent ?pfrom ?pto)
            (adjacent ?bfrom ?bto)
            (clear ?bto)
            (= ?pto ?bfrom)
        )
        :effect (and 
            (not (at player ?pfrom))
            (not (at box ?bfrom))
            (at player ?pto)
            (at box ?bto)
        )
    )
    
    (:action push_down
        :parameters (?pfrom ?pto ?bfrom ?bto - pos)
        :precondition (and 
            (at player ?pfrom)
            (at box ?bfrom)
            (adjacent ?pfrom ?pto)
            (adjacent ?bfrom ?bto)
            (clear ?bto)
            (= ?pto ?bfrom)
        )
        :effect (and 
            (not (at player ?pfrom))
            (not (at box ?bfrom))
            (at player ?pto)
            (at box ?bto)
        )
    )
    
    (:action push_left
        :parameters (?pfrom ?pto ?bfrom ?bto - pos)
        :precondition (and 
            (at player ?pfrom)
            (at box ?bfrom)
            (adjacent ?pfrom ?pto)
            (adjacent ?bfrom ?bto)
            (clear ?bto)
            (= ?pto ?bfrom)
        )
        :effect (and 
            (not (at player ?pfrom))
            (not (at box ?bfrom))
            (at player ?pto)
            (at box ?bto)
        )
    )
    
    (:action push_right
        :parameters (?pfrom ?pto ?bfrom ?bto - pos)
        :precondition (and 
            (at player ?pfrom)
            (at box ?bfrom)
            (adjacent ?pfrom ?pto)
            (adjacent ?bfrom ?bto)
            (clear ?bto)
            (= ?pto ?bfrom)
        )
        :effect (and 
            (not (at player ?pfrom))
            (not (at box ?bfrom))
            (at player ?pto)
            (at box ?bto)
        )
    )
)