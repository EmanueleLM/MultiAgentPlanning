(define (problem blocksworld-12)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        yellow - block
        orange - block
    )
    (:init
        ; Blocks clear initially (no block on top)
        (clear red)
        (clear blue)
        (clear yellow)
        
        (handempty)

        ; red is on orange
        (on red orange)
        
        ; blue, orange, yellow are on the table
        (ontable blue)
        (ontable orange)
        (ontable yellow)
    )
    (:goal (and
        (on blue orange)
        (on orange yellow)
    ))
)