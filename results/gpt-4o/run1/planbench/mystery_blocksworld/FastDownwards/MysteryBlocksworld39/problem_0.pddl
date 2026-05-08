(define (problem jack_of_all_trades_problem)
    (:domain jack_of_all_trades)
    (:objects
        object_a object_b object_c object_d - object
    )
    (:init
        (craves object_b object_c)
        (craves object_c object_a)
        (harmony)
        (planet object_a)
        (planet object_d)
        (province object_b)
        (province object_d)
    )
    (:goal (and
        (craves object_b object_d)
        (craves object_c object_a)
    ))
)