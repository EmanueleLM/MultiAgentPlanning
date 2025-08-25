(define (domain integrated_vault_operation)
        (:types robot item location vault - object)

        (:predicates 
            (vault_closed ?v - vault)
            (vault_open ?v - vault)
            (robot_has_key ?r - robot ?k - item)
            (robot_near_vault ?r - robot ?v - vault)
            (object_grabbed ?r - robot)
            (at ?entity - object ?location - location)
            (has ?entity - robot ?item - item)
            (object_inside ?v - vault)
            (object_retrieved)
        )

        ;; Actions for the first robot (key_holder)
        (:action open_vault_key_holder
            :parameters (?r - robot ?v - vault ?k - item)
            :precondition (and 
                (vault_closed ?v)
                (robot_has_key ?r ?k)
                (robot_near_vault ?r ?v))
            :effect (and 
                (vault_open ?v)
                (not (vault_closed ?v)))
        )

        (:action grab_object_key_holder
            :parameters (?r - robot ?v - vault)
            :precondition (and 
                (vault_open ?v)
                (robot_near_vault ?r ?v))
            :effect (object_grabbed ?r)
        )

        ;; Actions for the second robot (small_robot)
        (:action pick-up-key_small_robot
            :parameters (?r - robot ?k - item ?loc - location)
            :precondition (and (at ?r ?loc) (at ?k ?loc))
            :effect (has ?r ?k))
        
        (:action open_vault_small_robot
            :parameters (?r - robot ?v - vault ?k - item)
            :precondition (and (has ?r ?k) (vault_closed ?v))
            :effect (vault_open ?v))
        
        (:action grab_object_small_robot
            :parameters (?r - robot ?v - vault)
            :precondition (and (vault_open ?v) (object_inside ?v))
            :effect (and (object_retrieved) (not (object_inside ?v))))
    )