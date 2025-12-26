(define (problem hanoi-5-disks-P1-to-P2)
    (:domain hanoi)
    (:objects
        a b c d e - disk  ; A smallest, E largest
        p1 p2 p3 - peg    ; P1 Left, P2 Middle, P3 Right
    )
    (:init
        ; Size ordering: A < B < C < D < E
        (smaller a b) (smaller a c) (smaller a d) (smaller a e)
        (smaller b c) (smaller b d) (smaller b e)
        (smaller c d) (smaller c e)
        (smaller d e)

        ; P1 Stack: A/B/C/D/E (Top to Bottom)
        (on a b) (on b c) (on c d) (on d e)

        ; P1 base and top disk (A is clear)
        (base e p1)
        (top a)

        ; P2 and P3 are empty
        (empty p2)
        (empty p3)
    )
    (:goal (and
        ; Target state: P2 stack A/B/C/D/E
        (on a b) (on b c) (on c d) (on d e)
        (base e p2)
        (top a)
        (empty p1)
        (empty p3)
    ))
)