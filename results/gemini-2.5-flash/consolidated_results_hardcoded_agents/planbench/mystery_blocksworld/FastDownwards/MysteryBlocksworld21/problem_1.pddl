(define (problem pb21)
    (:domain MysteryBlocksworld)
    (:objects 
        a b c d - object
    )
    
    (:init
        (object-craves a d)
        (object-craves d c)
        (harmony)
        (planet b)
        (planet c)
        (province a)
        (province b)
    )
    
    (:goal (and
        (object-craves b c)
        (object-craves d a)
    ))
)