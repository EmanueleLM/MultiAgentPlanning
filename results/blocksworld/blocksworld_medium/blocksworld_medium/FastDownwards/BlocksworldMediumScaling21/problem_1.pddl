(define (problem blocksworld-21)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        yellow - block
        red - block
    )
    (:init
        (hand-empty)
        
        ; Initial configuration: blue/yellow, orange/red. Y and R on table.
        (on blue yellow)
        (on orange red)
        
        (on-table red)
        (on-table yellow)
        
        ; Blocks B and O are clear (nothing on top, not held).
        ; Blocks R and Y are not clear (support other blocks).
        (clear blue)
        (clear orange)
    )
    (:goal (and
        (on red orange)
        (on yellow red)
    ))
)