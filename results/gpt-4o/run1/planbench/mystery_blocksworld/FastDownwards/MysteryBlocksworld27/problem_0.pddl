(define (problem jack_of_all_trades_problem)
    (:domain jack_of_all_trades)
    (:objects 
        a - object
        b - object
        c - object
        d - object
    )
    (:init 
        (craves a d)
        (craves c b)
        (harmony)
        (planet b)
        (planet d)
        (province a)
        (province c)
    )
    (:goal (and 
        (craves b a)
        (craves c b)
        (craves d c)
    ))
)