(define (problem hanoi-5-disks)
    (:domain HANOI-5)
    (:objects
        A B C D E - disk ; A is smallest, E is largest
        L M R - peg      ; Left, Middle, Right
    )
    (:init
        ; Size relations: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial stack configuration on Left (L): A on B on C on D on E (top to bottom)
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-disk D E)
        (on-peg E L)

        ; Disks below A are not clear
        ; Only A is clear (top disk)
        (clear A)

        ; Peg status: M and R are empty
        (peg-clear M)
        (peg-clear R)

        ; Location tracking (All disks start on L)
        (at A L) (at B L) (at C L) (at D L) (at E L)
        (at A M) (at B M) (at C M) (at D M) (at E M) ; Must explicitly state not-at for disks not on peg M or R
        (at A R) (at B R) (at C R) (at D R) (at E R) ; Wait, the (at ?d ?p) should only be true for the peg where the disk is located.

        ; Let's fix the initial definition of (clear ?d) and (at ?d ?p) for disks B, C, D, E.
        ; Since PDDL STRIPS implies negation unless explicitly stated, defining (at A L) means (at A M) and (at A R) are false by default if they are effects.
        ; However, it is standard practice to define ALL initial positive facts.

        ; Since the location (at ?d ?p) is changed in the effects, we must initialize the location correctly.
        (not (clear B)) (not (clear C)) (not (not D)) (not (clear E)) ; implicitly handled by not listing them
        (not (peg-clear L)) ; implicitly handled by not listing it
    )
    (:init
        ; Size relations: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Stack configuration on Left (L): A on B on C on D on E
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-disk D E)
        (on-peg E L)

        ; Clarity: A is clear, others are not
        (clear A)
        
        ; Peg status
        (peg-clear M)
        (peg-clear R)

        ; Location tracking (All disks start on L)
        (at A L) (at B L) (at C L) (at D L) (at E L)
    )
    (:goal (and
        ; Goal: All disks must be located on peg R
        (at A R)
        (at B R)
        (at C R)
        (at D R)
        (at E R)
        ; Implicitly requires peg L and M to be peg-clear, but since E must be on the floor (on-peg E R) for the stack to be complete, 
        ; and all other disks are moved, L and M being empty will be a side effect of achieving the goal state (at ?d R).
        ; If we wanted to strictly enforce M being empty, we'd add (peg-clear M). Since the problem description allows M to be used 
        ; as intermediate parking but must end up empty, we check if all disks are on R. If all disks are on R, M must be empty.
    ))
)