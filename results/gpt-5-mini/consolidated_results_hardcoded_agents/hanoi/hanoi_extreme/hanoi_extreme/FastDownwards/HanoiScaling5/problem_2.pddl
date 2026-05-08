(define (problem hanoi-7-problem)
  (:domain hanoi-7)
  (:objects
    a b c d e f g - disk
    left middle right - peg
  )
  (:init
    ;; size ordering: explicit "smaller" facts for every pair with strictly smaller size
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)

    ;; initial stack on the right peg: top a on b, b on c, ..., f on g, bottom g on right
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-peg g right)

    ;; clear/empty predicates consistent with above
    (clear a)
    ;; b..g are not clear initially (implicitly by absence of (clear ...) facts)
    (empty left)
    (empty middle)
    ;; right is not empty (no (empty right) fact)
  )

  (:goal (and
    ;; full stack moved to left peg with same internal ordering
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-peg g left)
    ;; intermediate and original pegs must be empty
    (empty middle)
    (empty right)
  ))
)