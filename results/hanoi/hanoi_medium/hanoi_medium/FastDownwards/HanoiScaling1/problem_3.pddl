(define (problem hanoi-4-disks-to-left)
    (:domain hanoi-4-disks)
    (:objects
        a b c d - disk
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
        
        ; Initial Stacking (Right peg: A/B/C/D, top to bottom)
        (on a b)
        (on b c)
        (on c d)
        (on d right)
        
        ; Clearance: A is clear (top disk), Left and Middle pegs are clear (empty)
        (clear a)
        (clear left)
        (clear middle)

        ; Initial Peg Association (All disks start on Right)
        (disk-on-peg a right)
        (disk-on-peg b right)
        (disk-on-peg c right)
        (disk-on-peg d right)

        (= (total-cost) 0)
    )
    (:goal (and
        ; All disks must be associated with the left peg
        (disk-on-peg a left)
        (disk-on-peg b left)
        (disk-on-peg c left)
        (disk-on-peg d left)
        
        ; Terminal condition: Right and Middle pegs must be empty (clear)
        (clear right)
        (clear middle)
    ))
    (:metric minimize (total-cost))
)