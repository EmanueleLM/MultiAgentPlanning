(define (problem hanoi-4-to-r)
    (:domain hanoi-4-disks)
    (:objects
        a b c d - disk
        left middle right - peg
    )
    (:init
        ; Static size constraints (a smallest, d largest)
        (smaller a b) (smaller a c) (smaller a d)
        (smaller b c) (smaller b d)
        (smaller c d)

        ; Initial placement on Peg left: d, c, b, a (bottom up)
        (on d left)
        (on c d)
        (on b c)
        (on a b)

        ; Clear status
        (clear a)       ; Top disk
        (clear middle)  ; Empty peg
        (clear right)   ; Empty peg
        ; Left is not clear since D is on it. D, C, B are not clear since something is on them.

        ; Cost initialization
        (= (total-cost) 0)
    )
    (:goal
        (and
            ; Goal stack: d, c, b, a on right
            (on d right)
            (on c d)
            (on b c)
            (on a b)
            ; Pegs left and middle must be empty
            (clear left)
            (clear middle)
        )
    )
    (:metric minimize (total-cost))
)