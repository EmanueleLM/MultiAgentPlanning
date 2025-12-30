(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block) 
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
        
        ; Static predicates for Hanoi constraints
        (smaller ?x - block ?y - block) ; X must be strictly smaller than Y
        (is_disk ?x - block) ; X is a movable disk (A-F)
    )
    
    (:functions
        (total-cost)
    )

    ;; 1. PICK UP: Disabled for disks (A-F) as they are never (ontable) in this 3-peg setup.
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (is_disk ?x)
            (clear ?x) 
            (ontable ?x)
            (handempty)
        )
        :effect (and 
            (not (ontable ?x)) 
            (not (clear ?x))
            (not (handempty))
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    ;; 2. PUT DOWN: Disabled as it violates the peg structure by placing a disk onto a general table.
    (:action put-down
        :parameters (?x - block)
        :precondition (and 
            (is_disk ?x)
            (holding ?x)
        )
        :effect (and 
            (not (holding ?x))
            (handempty)
            (ontable ?x)
            (clear ?x)
            (increase (total-cost) 1)
        )
    )

    ;; 3. UNSTACK: Take disk X off support Y (disk or peg base L/M/R)
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (is_disk ?x)
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (not (on ?x ?y))
            (not (clear ?x))
            (not (handempty))
            (holding ?x)
            (clear ?y)
            (increase (total-cost) 1)
        )
    )

    ;; 4. STACK: Put held disk X onto support Y (disk or peg base L/M/R). Enforces size constraint.
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (is_disk ?x)
            (holding ?x) 
            (clear ?y)
            
            ; HARD CONSTRAINT: X must be smaller than Y
            (smaller ?x ?y)
        )
        :effect (and 
            (not (holding ?x))
            (not (clear ?y))
            (handempty)
            (on ?x ?y)
            (clear ?x)
            (increase (total-cost) 1)
        )
    )