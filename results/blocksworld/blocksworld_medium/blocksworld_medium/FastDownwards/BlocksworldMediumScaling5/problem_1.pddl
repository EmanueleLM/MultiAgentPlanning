(define (problem blocksworld-medium-scaling5-p)
    (:domain blocksworld-medium-scaling5)
    (:objects
        orange - block
        red - block
        yellow - block
        blue - block
    )
    (:init
        ;; Hand status
        (handempty)

        ;; Stack configuration: Blue(Table), Yellow(Blue), Red(Yellow), Orange(Red)
        (ontable blue)
        (on yellow blue)
        (on red yellow)
        (on orange red)
        
        ;; Clear status: Only Orange is clear
        (clear orange)
    )
    (:goal (and
        (on yellow orange)
    ))
)