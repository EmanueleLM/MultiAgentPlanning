(define (domain floortile)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        robot - object
        tile - object
        color - object
    )

    (:predicates
        (robot-at ?r - robot ?t - tile)
        (robot-has ?r - robot ?c - color)
        (painted ?t - tile ?c - color)
        (clear ?t - tile)
        
        ; Connectivity predicates
        (up ?t1 - tile ?t2 - tile)
        (down ?t1 - tile ?t2 - tile)
        (left ?t1 - tile ?t2 - tile)
        (right ?t1 - tile ?t2 - tile)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Change Color (Cost 5)
    (:action change-color
        :parameters (?r - robot ?c1 - color ?c2 - color)
        :precondition (and
            (robot-has ?r ?c1)
            (not (= ?c1 ?c2))
        )
        :effect (and
            (not (robot-has ?r ?c1))
            (robot-has ?r ?c2)
            (increase (total-cost) 5)
        )
    )

    ;; 2. Paint Up (Cost 2)
    (:action paint-up
        :parameters (?r - robot ?t1 - tile ?t2 - tile ?c - color)
        :precondition (and
            (robot-at ?r ?t1)
            (robot-has ?r ?c)
            (up ?t1 ?t2)
            (clear ?t2)
        )
        :effect (and
            (painted ?t2 ?c)
            (not (clear ?t2)) 
            (increase (total-cost) 2)
        )
    )
    
    ;; 3. Paint Down (Cost 2)
    (:action paint-down
        :parameters (?r - robot ?t1 - tile ?t2 - tile ?c - color)
        :precondition (and
            (robot-at ?r ?t1)
            (robot-has ?r ?c)
            (down ?t1 ?t2)
            (clear ?t2)
        )
        :effect (and
            (painted ?t2 ?c)
            (not (clear ?t2))
            (increase (total-cost) 2)
        )
    )

    ;; 4. Move Up (Cost 3)
    (:action up
        :parameters (?r - robot ?t1 - tile ?t2 - tile)
        :precondition (and
            (robot-at ?r ?t1)
            (up ?t1 ?t2)
            (clear ?t2)
        )
        :effect (and
            (not (robot-at ?r ?t1))
            (robot-at ?r ?t2)
            (clear ?t1)
            (not (clear ?t2))
            (increase (total-cost) 3)
        )
    )

    ;; 5. Move Down (Cost 1)
    (:action down
        :parameters (?r - robot ?t1 - tile ?t2 - tile)
        :precondition (and
            (robot-at ?r ?t1)
            (down ?t1 ?t2)
            (clear ?t2)
        )
        :effect (and
            (not (robot-at ?r ?t1))
            (robot-at ?r ?t2)
            (clear ?t1)
            (not (clear ?t2))
            (increase (total-cost) 1)
        )
    )

    ;; 6. Move Right (Cost 1)
    (:action right
        :parameters (?r - robot ?t1 - tile ?t2 - tile)
        :precondition (and
            (robot-at ?r ?t1)
            (right ?t1 ?t2)
            (clear ?t2)
        )
        :effect (and
            (not (robot-at ?r ?t1))
            (robot-at ?r ?t2)
            (clear ?t1)
            (not (clear ?t2))
            (increase (total-cost) 1)
        )
    )

    ;; 7. Move Left (Cost 1)
    (:action left
        :parameters (?r - robot ?t1 - tile ?t2 - tile)
        :precondition (and
            (robot-at ?r ?t1)
            (left ?t1 ?t2)
            (clear ?t2)
        )
        :effect (and
            (not (robot-at ?r ?t1))
            (robot-at ?r ?t2)
            (clear ?t1)
            (not (clear ?t2))
            (increase (total-cost) 1)
        )
    )
)