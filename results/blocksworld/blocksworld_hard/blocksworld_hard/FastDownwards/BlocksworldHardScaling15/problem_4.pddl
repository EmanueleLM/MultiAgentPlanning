(define (problem blocksworld-RBYO)
    (:domain blocks-world)
    (:objects
        R B O Y - block
    )
    (:init
        ; Hand status
        (handempty)

        ; Configuration defined by specification:
        ; blue on orange, orange on yellow, red on table, yellow on table.
        ; Stack: B/O/Y (Y is implicitly on the table)
        (on B O)
        (on O Y)
        (on-table Y)
        
        ; R is separate
        (on-table R)

        ; Clearance specified: red block is clear, blue block is clear.
        (clear R)
        (clear B)
    )
    (:goal
        (and
            ; red block on top of yellow block (on R Y)
            ; blue block on top of red block (on B R)
            ; yellow block on top of orange block (on Y O)
            
            ; This implies the stack B/R/Y/O, meaning O must be on the table.
            (on B R)
            (on R Y)
            (on Y O)
            (on-table O)
        )
    )
)