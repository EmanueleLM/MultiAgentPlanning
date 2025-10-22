(define (problem hanoi7instance17)
  (:domain hanoi)
  (:objects
    a b c d e f g - disk
    left middle right - peg
  )

  (:init
    ;; stack (top -> bottom): a,b,c,d,e,f,g on peg left
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g left)

    ;; top-of-stack / clear facts
    (clear a)
    (clear middle)
    (clear right)

    ;; initial root: all disks belong to stack rooted at left
    (root a left)
    (root b left)
    (root c left)
    (root d left)
    (root e left)
    (root f left)
    (root g left)

    ;; size ordering: smaller x y means x is smaller than y
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g right)
  ))
)