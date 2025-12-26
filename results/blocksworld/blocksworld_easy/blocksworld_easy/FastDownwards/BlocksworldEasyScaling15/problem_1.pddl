(define (problem blocksworld-easy-scaling-15-p0)
    (:domain blocksworld-bw)
    (:objects 
        orange yellow blue red - block
    )
    (:init 
        ; Blocks on the table
        (ontable red)
        (ontable orange)
        ; Stacks
        (on blue red)
        (on yellow blue)
        ; Clear blocks
        (clear yellow)
        (clear orange)
        ; Hand state
        (handempty)
        ; Costs
        (= (total-cost) 0)
    )
    (:goal (and 
        (on blue yellow)
        (on yellow orange)
    ))
    (:metric minimize (total-cost))
)