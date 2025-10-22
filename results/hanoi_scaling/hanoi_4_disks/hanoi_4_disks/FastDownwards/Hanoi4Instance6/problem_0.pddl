(define (problem hanoi-4-left-to-right)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
  )

  (:init
    ;; type marking predicates (informational, available for use if desired)
    (is-disk a) (is-disk b) (is-disk c) (is-disk d)
    (is-peg left) (is-peg middle) (is-peg right)

    ;; size ordering: a < b < c < d (a is smallest)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; initial stack on left peg top-to-bottom: a b c d
    (on a b)
    (on b c)
    (on c d)
    (on d left)

    ;; pegs middle and right are empty initially
    ;; clear facts: top elements and empty pegs are clear
    (clear a)
    (clear middle)
    (clear right)
  )

  (:goal (and
           ;; final stack on right peg top-to-bottom: a b c d
           (on a b)
           (on b c)
           (on c d)
           (on d right)
           ;; left and middle pegs must be empty
           (clear left)
           (clear middle)
         ))
)