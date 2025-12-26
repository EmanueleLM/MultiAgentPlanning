(define (problem hanoi-4-disks-to-left)
    (:domain hanoi-4-disks)
    (:objects
        a b c d - disk  ; A smallest, D largest
        left middle right - peg
    )
    (:init
        ; Size relationships: A < B < C < D
        (smaller a b)
        (smaller a c)
        (smaller a d)
        (smaller b c)
        (smaller b d)
        (smaller c d)
        
        ; Initial Stacking (Right peg: A/B/C/D)
        ; A on B
        (on a b)
        ; B on C
        (on b c)
        ; C on D
        (on c d)
        ; D on Right peg
        (on d right)
        
        ; Clearance: A is clear (top disk), Left and Middle pegs are clear (empty)
        (clear a)
        (clear left)
        (clear middle)
        
        ; Non-clear objects: b, c, d, right (supporting objects)

        ; Initial Peg Association (All disks start on Right)
        (disk-on-peg a right)
        (disk-on-peg b right)
        (disk-on-peg c right)
        (disk-on-peg d right)

        (= (total-cost) 0)
    )
    (:goal (and
        (disk-on-peg a left)
        (disk-on-peg b left)
        (disk-on-peg c left)
        (disk-on-peg d left)
    ))
    (:metric minimize (total-cost))
)