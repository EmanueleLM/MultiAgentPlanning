(define (problem hanoi-5)
    (:domain hanoi)
    (:objects
        a b c d e - disk
        peg_l peg_m peg_r - peg
    )
    (:init
        ; --- Size hierarchy: A < B < C < D < E ---
        (smaller a b) (smaller a c) (smaller a d) (smaller a e)
        (smaller b c) (smaller b d) (smaller b e)
        (smaller c d) (smaller c e)
        (smaller d e)

        ; --- Initial Stack on peg_M (A top, E bottom) ---
        (on a b)
        (on b c)
        (on c d)
        (on d e)
        (on e peg_m)

        ; --- Initial Clearance ---
        (clear a)
        (clear peg_l)
        (clear peg_r)

        ; Metric initialization
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target stack on peg_R (A/B/C/D/E stack configuration)
        (on a b)
        (on b c)
        (on c d)
        (on d e)
        (on e peg_r)
        
        ; Ensure peg_L and peg_M are empty (clear base)
        (clear peg_l)
        (clear peg_m)
    ))
    (:metric minimize (total-cost))
)