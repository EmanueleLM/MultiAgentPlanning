(define (problem integrated_open_and_grab_object)
        (:domain integrated_vault_operation)

        (:objects
            key_holder small_robot - robot
            key - item
            vault - vault
            vault_location - location
        )

        (:init 
            (vault_closed vault)
            (robot_has_key key_holder key)
            (robot_near_vault key_holder vault)
            (at small_robot vault_location)
            (at key vault_location)
            (object_inside vault)
        )

        (:goal (and 
            (vault_open vault)
            (object_retrieved)
        ))
    )