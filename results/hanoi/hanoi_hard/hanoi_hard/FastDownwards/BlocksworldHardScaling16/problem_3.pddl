(define (problem BlocksworldHardScaling16_problem)
    (:domain blocksworld)
    (:objects
        blue red orange yellow - block
    )
    
    (:init
        (handempty)
        
        ; Structure: Orange(Table) <- Red <- Yellow <- Blue
        (ontable orange)
        (on red orange)
        (on yellow red)
        (on blue yellow)
        
        ; Clear status
        (clear blue)
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        (on blue yellow)
        (on orange red)
    ))
    
    (:metric minimize (total-cost))
)