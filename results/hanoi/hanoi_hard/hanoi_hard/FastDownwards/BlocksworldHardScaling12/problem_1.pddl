(define (problem hanoi-6-R-to-L)
    (:domain hanoi-6-disks)
    (:objects
        a b c d e f - disk
        l m r - peg
    )
    (:init
        ; Size definitions: A < B < C < D < E < F
        (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
        (smaller b c) (smaller b d) (smaller b e) (smaller b f)
        (smaller c d) (smaller c e) (smaller c f)
        (smaller d e) (smaller d f)
        (smaller e f)

        ; Initial Configuration: Stack R holds A (top) -> F (bottom). L, M empty.
        
        ; Peg states
        (empty l)
        (empty m)

        ; Stack structure on R
        (on a b)
        (on b c)
        (on c d)
        (on d e)
        (on e f)

        ; Base disk
        (on-base f r)

        ; Topmost disk
        (clear a)

        ; Location tracking (All disks on R)
        (at a r) (at b r) (at c r) (at d r) (at e r) (at f r)

        ; Cost initialization
        (= (total-cost) 0)
    )
    (:goal (and
        ; Final Configuration: Stack L holds A (top) -> F (bottom). R, M empty.
        (on-base f l)
        (on a b)
        (on b c)
        (on c d)
        (on d e)
        (on e f)

        ; Ensure location consistency
        (at a l) (at b l) (at c l) (at d l) (at e l) (at f l)

        ; Ensure R and M are empty
        (empty r)
        (empty m)
        (clear a)
    ))
    (:metric minimize (total-cost))
)